import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var appState: AppStateViewModel

    var body: some View {
        TabView(selection: $appState.selectedTab) {
            TodayScreen(viewModel: .init(appState: appState))
                .tabItem { Label("Today", systemImage: "sun.min") }.tag(0)
            ClarityScreen(viewModel: .init(appState: appState))
                .tabItem { Label("Clarity", systemImage: "circle.lefthalf.filled") }.tag(1)
            InsightsScreen(appState: appState)
                .tabItem { Label("Insights", systemImage: "chart.xyaxis.line") }.tag(2)
            StudioScreen()
                .tabItem { Label("Studio", systemImage: "square.stack.3d.up") }.tag(3)
        }
        .tint(.white)
    }
}
