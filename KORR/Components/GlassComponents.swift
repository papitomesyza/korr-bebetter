import SwiftUI

struct GlassCard<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) { self.content = content() }

    var body: some View {
        content
            .padding()
            .background(.ultraThinMaterial.opacity(0.35), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.12), lineWidth: 1))
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title).font(.headline.weight(.semibold)).foregroundStyle(.white.opacity(0.92))
            Spacer()
        }
    }
}

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title).fontWeight(.semibold).frame(maxWidth: .infinity).padding(.vertical, 14)
        }
        .buttonStyle(.plain)
        .background(Color.white.opacity(0.15), in: RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.2), lineWidth: 1))
    }
}

struct OnboardingOptionCard: View {
    let title: String
    let selected: Bool
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.white.opacity(selected ? 0.18 : 0.08), in: RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(selected ? 0.35 : 0.12), lineWidth: 1))
    }
}
