import SwiftUI

struct PaywallView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 14) {
                Text("KORR Premium").font(.largeTitle.weight(.semibold)).foregroundStyle(.white)
                Text("A clearer internal state, earned daily.").foregroundStyle(.white.opacity(0.76))

                GlassCard { benefit("Unlimited habits") }
                GlassCard { benefit("Full clarity tracking") }
                GlassCard { benefit("Advanced insights & studio exports") }

                GlassCard {
                    VStack(alignment: .leading) {
                        Text("Weekly").foregroundStyle(.white.opacity(0.8))
                        Text("$6.99 / week").foregroundStyle(.white)
                    }
                }
                GlassCard {
                    VStack(alignment: .leading) {
                        Text("Annual").foregroundStyle(.white)
                        Text("$69.99 / year").font(.title3.weight(.semibold))
                        Text("Best value").font(.caption).foregroundStyle(.white.opacity(0.72))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                PrimaryButton(title: "Restore Purchases", action: {})
                Text("Terms • Privacy • Billing details").font(.footnote).foregroundStyle(.white.opacity(0.45))
                Spacer()
            }
            .padding()
            .background(Color.black.ignoresSafeArea())
            .toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Close") { dismiss() } } }
        }
    }

    private func benefit(_ text: String) -> some View {
        HStack { Image(systemName: "checkmark"); Text(text); Spacer() }
            .foregroundStyle(.white)
    }
}
