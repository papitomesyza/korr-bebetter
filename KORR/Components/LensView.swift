import SwiftUI

struct LensView: View {
    let clarity: Double
    @State private var breathe = false

    private var frost: Double { 1 - clarity / 100 }

    var body: some View {
        ZStack {
            Circle().fill(Color.white.opacity(0.05 + (clarity / 100) * 0.10))
                .blur(radius: 16 * frost)
            Circle().fill(RadialGradient(colors: [Color.white.opacity(0.22), Color.white.opacity(0.02)], center: .topLeading, startRadius: 10, endRadius: 180))
                .blur(radius: 10 * frost)
            Circle().stroke(Color.white.opacity(0.15 + clarity / 500), lineWidth: 1.2)
            Circle().stroke(Color.white.opacity(0.08 + clarity / 350), lineWidth: 16)
                .blur(radius: 10)
                .scaleEffect(breathe ? 1.03 : 0.98)
        }
        .frame(width: 230, height: 230)
        .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: breathe)
        .onAppear { breathe = true }
    }
}
