import Foundation

enum HabitPeriod: String, Codable, CaseIterable, Identifiable {
    case morning
    case day
    case night

    var id: String { rawValue }
    var title: String { rawValue.capitalized }
}

enum DifficultyWeight: String, Codable, CaseIterable, Identifiable {
    case light
    case standard
    case deep

    var id: String { rawValue }

    var multiplier: Double {
        switch self {
        case .light: return 1.0
        case .standard: return 1.5
        case .deep: return 2.0
        }
    }

    var title: String { rawValue.capitalized }
}

enum PrimaryGoal: String, Codable, CaseIterable, Identifiable {
    case energy = "Energy"
    case discipline = "Discipline"
    case focus = "Focus"
    case emotionalBalance = "Emotional Balance"
    case sleep = "Sleep"
    case generalRoutine = "General Routine"

    var id: String { rawValue }
}

enum DayWeakness: String, Codable, CaseIterable, Identifiable {
    case morning = "Morning"
    case day = "Day"
    case night = "Night"
    case changes = "It Changes"

    var id: String { rawValue }
}

enum RoutineStructure: String, Codable, CaseIterable, Identifiable {
    case veryLight = "Very Light"
    case balanced = "Balanced"
    case strict = "Strict"

    var id: String { rawValue }
}

enum CurrentPace: String, Codable, CaseIterable, Identifiable {
    case zero = "Starting From Zero"
    case inconsistent = "Inconsistent"
    case somewhatConsistent = "Somewhat Consistent"
    case disciplined = "Already Disciplined"

    var id: String { rawValue }
}

enum ResetFocus: String, Codable, CaseIterable, Identifiable {
    case sleepBetter = "Sleep Better"
    case moveDaily = "Move Daily"
    case drinkWater = "Drink Water"
    case reduceScreenTime = "Reduce Screen Time"
    case journal = "Journal"
    case meditate = "Meditate"
    case read = "Read"
    case custom = "Build Custom"

    var id: String { rawValue }
}
