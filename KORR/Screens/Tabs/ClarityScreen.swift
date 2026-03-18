import SwiftUI

struct ClarityScreen: View {
    @ObservedObject var viewModel: ClarityViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                LensView(clarity: viewModel.appState.clarityState.clarityScore)
                    .padding(.top, 24)
                Text("Level \(viewModel.appState.clarityState.level)")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white)
                Text("Clarity \(Int(viewModel.appState.clarityState.clarityScore))%")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.82))
                Text(viewModel.descriptor)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.65))

                GlassCard {
                    metricRow("7-day consistency", "\(Int(viewModel.appState.clarityState.current7DayConsistency * 100))%")
                    metricRow("Today completion", "\(Int(viewModel.appState.clarityState.todayCompletionRatio * 100))%")
                    metricRow("Stability XP", "\(Int(viewModel.appState.clarityState.stabilityXP))")
                    metricRow("Pacing", "Steady")
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }

    private func metricRow(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title).foregroundStyle(.white.opacity(0.70))
            Spacer()
            Text(value).foregroundStyle(.white)
        }
        .padding(.vertical, 3)
    }
}
