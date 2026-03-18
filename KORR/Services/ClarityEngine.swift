import Foundation

struct ClarityEngine {
    struct DayMetrics {
        let plannedWeightedPoints: Double
        let completedWeightedPoints: Double
        let completionRatio: Double
    }

    func metrics(on date: Date, habits: [Habit], completions: [DailyHabitCompletion]) -> DayMetrics {
        let activeHabits = habits.filter { !$0.archived }
        let planned = activeHabits.reduce(0.0) { $0 + $1.difficultyWeight.multiplier }
        guard planned > 0 else {
            return DayMetrics(plannedWeightedPoints: 0, completedWeightedPoints: 0, completionRatio: 0)
        }

        let dayCompletions = completions.filter { DateHelper.isSameDay($0.date, date) && $0.completed }
        let completedIDs = Set(dayCompletions.map(\.habitID))
        let completedPoints = activeHabits.filter { completedIDs.contains($0.id) }.reduce(0.0) { $0 + $1.difficultyWeight.multiplier }
        let ratio = completedPoints / planned
        return DayMetrics(plannedWeightedPoints: planned, completedWeightedPoints: completedPoints, completionRatio: ratio)
    }

    func completionRatio(on date: Date, habits: [Habit], completions: [DailyHabitCompletion]) -> Double {
        metrics(on: date, habits: habits, completions: completions).completionRatio
    }

    func dailyDelta(
        ratio: Double,
        plannedWeightedPoints: Double,
        recentRatios: [Double],
        consecutiveMissedDays: Int,
        overloadFlag: Bool
    ) -> Double {
        // Neutral day: no planned habits means no reward and no penalty.
        guard plannedWeightedPoints > 0 else { return 0 }

        var delta: Double
        switch ratio {
        case 0.90...1: delta = 0.55
        case 0.75..<0.90: delta = 0.30
        case 0.50..<0.75: delta = 0.05
        case 0.30..<0.50: delta = -0.20
        default: delta = -0.45
        }

        let successfulDays = recentRatios.filter { $0 >= 0.75 }.count
        if successfulDays >= 5 { delta += 0.10 }
        if consecutiveMissedDays >= 2 { delta -= 0.15 }
        if overloadFlag { delta -= 0.10 }
        return delta
    }

    func applyDay(state: ClarityState, delta: Double, todayRatio: Double, evaluationDate: Date) -> ClarityState {
        let nextClarity = min(100, max(0, state.clarityScore + delta))
        let xpGain = max(0, delta * 8)
        let xpLoss = delta < 0 ? min(1.25, abs(delta) * 1.75) : 0
        let nextXP = max(0, state.stabilityXP + xpGain - xpLoss)
        let level = min(99, max(0, Int(floor(nextXP / 100))))

        return ClarityState(
            clarityScore: nextClarity,
            stabilityXP: nextXP,
            level: level,
            lastEvaluatedDate: DateHelper.startOfDay(evaluationDate),
            current7DayConsistency: state.current7DayConsistency,
            todayCompletionRatio: todayRatio
        )
    }
}
