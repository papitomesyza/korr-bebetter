import SwiftUI

struct StudioScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Studio").font(.largeTitle.weight(.semibold)).frame(maxWidth: .infinity, alignment: .leading)
                GlassCard { Text("Story Export").frame(maxWidth: .infinity, alignment: .leading) }
                GlassCard { Text("Milestone Card").frame(maxWidth: .infinity, alignment: .leading) }
                GlassCard { Text("Monthly Clarity Poster").frame(maxWidth: .infinity, alignment: .leading) }
                GlassCard { Text("Before vs Now").frame(maxWidth: .infinity, alignment: .leading) }
            }
            .foregroundStyle(.white)
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
