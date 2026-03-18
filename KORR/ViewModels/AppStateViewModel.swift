import Foundation
import SwiftUI

@MainActor
final class AppStateViewModel: ObservableObject {
    @Published var onboardingProfile: OnboardingProfile?
    @Published var habits: [Habit] = []
    @Published var completions: [DailyHabitCompletion] = []
    @Published var clarityState: ClarityState = .initial
    @Published var selectedTab: Int = 0
    @Published var showPaywall = false

    private let persistence = PersistenceManager.shared
    private let clarityEngine = ClarityEngine()

    var hasOnboarded: Bool { onboardingProfile != nil }

    init() {
        load()
        evaluateIfNeeded()
    }

    func load() {
        onboardingProfile = persistence.load(OnboardingProfile.self, key: "onboarding")
        habits = persistence.load([Habit].self, key: "habits") ?? []
        completions = persistence.load([DailyHabitCompletion].self, key: "completions") ?? []
        clarityState = persistence.load(ClarityState.self, key: "clarity") ?? .initial
    }

    func saveAll() {
        if let onboardingProfile { persistence.save(onboardingProfile, key: "onboarding") }
        persistence.save(habits, key: "habits")
        persistence.save(completions, key: "completions")
        persistence.save(clarityState, key: "clarity")
    }

    func completeOnboarding(_ profile: OnboardingProfile) {
        onboardingProfile = profile
        habits = HabitLibrary.starterPlan(from: profile)
        saveAll()
    }

    func evaluateIfNeeded() {
        guard DateHelper.hasNewDayStarted(since: clarityState.lastEvaluatedDate) else { return }
        let daysToEvaluate = DateHelper.daysBetweenExclusive(from: clarityState.lastEvaluatedDate, to: Date())
        guard !daysToEvaluate.isEmpty else { return }

        var state = clarityState
        for day in daysToEvaluate {
            let metrics = clarityEngine.metrics(on: day, habits: habits, completions: completions)
            let rollingWindow = DateHelper.trailingDays(from: day, count: 7).map {
                clarityEngine.completionRatio(on: $0, habits: habits, completions: completions)
            }
            let consecutiveMissed = rollingWindow.prefix(2).filter { $0 < 0.30 }.count
            let overload = rollingWindow.filter { $0 < 0.50 }.count >= 4 && habits.count >= 8
            let delta = clarityEngine.dailyDelta(
                ratio: metrics.completionRatio,
                plannedWeightedPoints: metrics.plannedWeightedPoints,
                recentRatios: rollingWindow,
                consecutiveMissedDays: consecutiveMissed,
                overloadFlag: overload
            )
            state = clarityEngine.applyDay(
                state: state,
                delta: delta,
                todayRatio: clarityEngine.completionRatio(on: Date(), habits: habits, completions: completions),
                evaluationDate: day
            )
        }

        let currentWindow = DateHelper.trailingDays(from: Date(), count: 7).map {
            clarityEngine.completionRatio(on: $0, habits: habits, completions: completions)
        }
        state.current7DayConsistency = Double(currentWindow.filter { $0 >= 0.75 }.count) / 7.0
        state.todayCompletionRatio = clarityEngine.completionRatio(on: Date(), habits: habits, completions: completions)
        clarityState = state
        saveAll()
    }
}
