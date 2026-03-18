import Foundation

@MainActor
final class OnboardingViewModel: ObservableObject {
    @Published var step = 0
    @Published var primaryGoal: PrimaryGoal?
    @Published var weakest: DayWeakness?
    @Published var structure: RoutineStructure?
    @Published var pace: CurrentPace?
    @Published var resetFocus: ResetFocus?

    var progress: Double { Double(step + 1) / 5.0 }

    var canContinue: Bool {
        switch step {
        case 0: return primaryGoal != nil
        case 1: return weakest != nil
        case 2: return structure != nil
        case 3: return pace != nil
        case 4: return resetFocus != nil
        default: return false
        }
    }

    func makeProfile() -> OnboardingProfile? {
        guard let primaryGoal, let weakest, let structure, let pace, let resetFocus else { return nil }
        return .init(primaryGoal: primaryGoal,
                     weakestTimeOfDay: weakest,
                     desiredStructure: structure,
                     currentPace: pace,
                     firstResetFocus: resetFocus,
                     completedAt: Date())
    }
}
