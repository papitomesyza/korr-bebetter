import Foundation

enum HabitLibrary {
    static let suggestedHabits: [Habit] = [
        .init(id: UUID(), title: "Wake On Time", period: .morning, scheduledTime: .init(hour: 7, minute: 0), isSuggested: true, isCustom: false, icon: "alarm", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Hydrate", period: .morning, scheduledTime: .init(hour: 7, minute: 10), isSuggested: true, isCustom: false, icon: "drop", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Make Bed", period: .morning, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "bed.double", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "No Phone First 15 Min", period: .morning, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "iphone.slash", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Sunlight Exposure", period: .morning, scheduledTime: .init(hour: 8, minute: 0), isSuggested: true, isCustom: false, icon: "sun.max", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "5-Minute Stretch", period: .morning, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "figure.flexibility", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Deep Work Block", period: .day, scheduledTime: .init(hour: 10, minute: 0), isSuggested: true, isCustom: false, icon: "brain", difficultyWeight: .deep, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "10-Minute Walk", period: .day, scheduledTime: .init(hour: 13, minute: 0), isSuggested: true, isCustom: false, icon: "figure.walk", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Water Target", period: .day, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "drop.fill", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Healthy Meal", period: .day, scheduledTime: .init(hour: 12, minute: 30), isSuggested: true, isCustom: false, icon: "leaf", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Read 10 Pages", period: .day, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "book", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Workout", period: .day, scheduledTime: .init(hour: 17, minute: 0), isSuggested: true, isCustom: false, icon: "dumbbell", difficultyWeight: .deep, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "No Screens Before Bed", period: .night, scheduledTime: .init(hour: 21, minute: 0), isSuggested: true, isCustom: false, icon: "moon.zzz", difficultyWeight: .deep, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Tidy Space", period: .night, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "sparkles", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Reflection Journal", period: .night, scheduledTime: .init(hour: 21, minute: 30), isSuggested: true, isCustom: false, icon: "pencil", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Prep Tomorrow", period: .night, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "calendar", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Skincare", period: .night, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "hands.sparkles", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Sleep On Time", period: .night, scheduledTime: .init(hour: 22, minute: 30), isSuggested: true, isCustom: false, icon: "bed.double.fill", difficultyWeight: .deep, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Night Meditation", period: .night, scheduledTime: .init(hour: 22, minute: 0), isSuggested: true, isCustom: false, icon: "wind", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Breathwork", period: .morning, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "lungs", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Protein Breakfast", period: .morning, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "fork.knife", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Short Walk", period: .morning, scheduledTime: .init(hour: 8, minute: 30), isSuggested: true, isCustom: false, icon: "figure.walk.motion", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Set Daily Intention", period: .morning, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "target", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Posture Reset", period: .day, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "figure.stand", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "No Impulse Scrolling Block", period: .day, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "hand.raised", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Journal Check-In", period: .day, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "note.text", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Inbox Clear", period: .day, scheduledTime: .init(hour: 16, minute: 30), isSuggested: true, isCustom: false, icon: "tray.full", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Read Instead of Scroll", period: .night, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "text.book.closed", difficultyWeight: .standard, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Gratitude Note", period: .night, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "heart.text.square", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false),
        .init(id: UUID(), title: "Light Stretching", period: .night, scheduledTime: nil, isSuggested: true, isCustom: false, icon: "figure.cooldown", difficultyWeight: .light, repeatConfiguration: nil, createdAt: .now, archived: false)
    ]

    static func starterPlan(from profile: OnboardingProfile) -> [Habit] {
        var selected: [Habit] = []

        func pick(_ title: String) { if let h = suggestedHabits.first(where: { $0.title == title }) { selected.append(h) } }

        switch profile.primaryGoal {
        case .sleep:
            ["No Screens Before Bed", "Sleep On Time", "Night Meditation", "Prep Tomorrow"].forEach(pick)
        case .energy:
            ["Hydrate", "Sunlight Exposure", "10-Minute Walk", "Water Target"].forEach(pick)
        case .focus:
            ["No Phone First 15 Min", "Deep Work Block", "No Impulse Scrolling Block"].forEach(pick)
        case .discipline:
            ["Wake On Time", "Make Bed", "Prep Tomorrow", "Deep Work Block"].forEach(pick)
        case .emotionalBalance:
            ["Breathwork", "Journal Check-In", "Reflection Journal", "Night Meditation"].forEach(pick)
        case .generalRoutine:
            ["Wake On Time", "Hydrate", "Healthy Meal", "Sleep On Time"].forEach(pick)
        }

        switch profile.firstResetFocus {
        case .moveDaily: pick("Workout")
        case .drinkWater: pick("Water Target")
        case .journal: pick("Reflection Journal")
        case .meditate: pick("Night Meditation")
        case .read: pick("Read 10 Pages")
        case .reduceScreenTime: pick("No Impulse Scrolling Block")
        case .sleepBetter: pick("No Screens Before Bed")
        case .custom: break
        }

        let count: Int
        switch (profile.desiredStructure, profile.currentPace) {
        case (.veryLight, _), (_, .zero): count = 4
        case (.strict, .disciplined): count = 8
        default: count = 6
        }

        let deduped = Array(Set(selected)).sorted { $0.title < $1.title }
        return Array(deduped.prefix(count))
    }
}
