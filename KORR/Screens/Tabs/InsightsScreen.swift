import SwiftUI

struct InsightsScreen: View {
    let appState: AppStateViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Insights").font(.largeTitle.weight(.semibold)).frame(maxWidth: .infinity, alignment: .leading)
                metric("Completed today", countFor(days: 1))
                metric("This week", countFor(days: 7))
                metric("This month", countFor(days: 30))
                metric("This year", countFor(days: 365))
                GlassCard { Text("Recommendation: keep the habit load tight and repeatable.").foregroundStyle(.white.opacity(0.78)).frame(maxWidth: .infinity, alignment: .leading) }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }

    private func countFor(days: Int) -> Int {
        let window = DateHelper.trailingDays(from: Date(), count: days)
        return appState.completions.filter { c in c.completed && window.contains(where: { DateHelper.isSameDay($0, c.date) }) }.count
    }

    private func metric(_ title: String, _ value: Int) -> some View {
        GlassCard {
            HStack {
                Text(title).foregroundStyle(.white.opacity(0.72))
                Spacer()
                Text("\(value)").font(.title3.weight(.semibold))
            }
        }
    }
}
