import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appState: AppStateViewModel

    var body: some View {
        Group {
            if appState.hasOnboarded {
                MainTabView()
            } else {
                OnboardingFlowView()
            }
        }
        .sheet(isPresented: $appState.showPaywall) {
            PaywallView()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
