import SwiftUI

struct OnboardingFlowView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    @StateObject private var vm = OnboardingViewModel()

    var body: some View {
        VStack(spacing: 24) {
            ProgressView(value: vm.progress).tint(.white)
            Text(title).font(.largeTitle.weight(.semibold)).foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            options
            Spacer()
            PrimaryButton(title: vm.step == 4 ? "Complete" : "Continue") {
                if vm.step == 4, let profile = vm.makeProfile() {
                    appState.completeOnboarding(profile)
                } else {
                    withAnimation(.easeInOut(duration: 0.25)) { vm.step += 1 }
                }
            }
            .disabled(!vm.canContinue)
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }

    private var title: String {
        switch vm.step {
        case 0: return "What are you improving now?"
        case 1: return "Which part of your day feels weakest?"
        case 2: return "How structured should this feel?"
        case 3: return "What is your current pace?"
        default: return "Choose your first reset focus"
        }
    }

    @ViewBuilder private var options: some View {
        let grid = [GridItem(.flexible())]
        LazyVGrid(columns: grid, spacing: 10) {
            switch vm.step {
            case 0:
                ForEach(PrimaryGoal.allCases) { option in
                    optionView(title: option.rawValue, selected: vm.primaryGoal == option) { vm.primaryGoal = option }
                }
            case 1:
                ForEach(DayWeakness.allCases) { option in
                    optionView(title: option.rawValue, selected: vm.weakest == option) { vm.weakest = option }
                }
            case 2:
                ForEach(RoutineStructure.allCases) { option in
                    optionView(title: option.rawValue, selected: vm.structure == option) { vm.structure = option }
                }
            case 3:
                ForEach(CurrentPace.allCases) { option in
                    optionView(title: option.rawValue, selected: vm.pace == option) { vm.pace = option }
                }
            default:
                ForEach(ResetFocus.allCases) { option in
                    optionView(title: option.rawValue, selected: vm.resetFocus == option) { vm.resetFocus = option }
                }
            }
        }
    }

    private func optionView(title: String, selected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) { OnboardingOptionCard(title: title, selected: selected) }
            .buttonStyle(.plain)
    }
}
