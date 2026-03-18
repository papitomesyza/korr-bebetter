import Foundation

struct Habit: Identifiable, Codable, Hashable {
    var id: UUID
    var title: String
    var period: HabitPeriod
    var scheduledTime: DateComponents?
    var isSuggested: Bool
    var isCustom: Bool
    var icon: String?
    var difficultyWeight: DifficultyWeight
    var repeatConfiguration: String?
    var createdAt: Date
    var archived: Bool
}

struct DailyHabitCompletion: Identifiable, Codable, Hashable {
    var id: UUID
    var habitID: UUID
    var date: Date
    var completed: Bool
    var completedAt: Date?
}

struct ClarityState: Codable, Hashable {
    var clarityScore: Double
    var stabilityXP: Double
    var level: Int
    var lastEvaluatedDate: Date
    var current7DayConsistency: Double
    var todayCompletionRatio: Double

    static let initial = ClarityState(
        clarityScore: 8,
        stabilityXP: 0,
        level: 0,
        lastEvaluatedDate: DateHelper.startOfDay(Date()),
        current7DayConsistency: 0,
        todayCompletionRatio: 0
    )
}
