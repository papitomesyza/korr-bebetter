import Foundation

struct OnboardingProfile: Codable {
    var primaryGoal: PrimaryGoal
    var weakestTimeOfDay: DayWeakness
    var desiredStructure: RoutineStructure
    var currentPace: CurrentPace
    var firstResetFocus: ResetFocus
    var completedAt: Date
}
