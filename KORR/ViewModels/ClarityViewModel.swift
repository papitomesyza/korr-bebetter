import Foundation

@MainActor
final class ClarityViewModel: ObservableObject {
    let appState: AppStateViewModel

    init(appState: AppStateViewModel) {
        self.appState = appState
    }

    var descriptor: String {
        switch appState.clarityState.clarityScore {
        case 0..<21: return "Dense static. Keep the rhythm gentle."
        case 21..<41: return "Shape returns. Friction is easing."
        case 41..<61: return "The lens is opening."
        case 61..<81: return "Stable cadence. Visual field is clear."
        default: return "Refined state. Protect the structure."
        }
    }
}
