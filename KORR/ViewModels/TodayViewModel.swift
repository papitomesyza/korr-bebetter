import Foundation

@MainActor
final class TodayViewModel: ObservableObject {
    @Published var showingAddSheet = false
    @Published var editingHabit: Habit?

    let appState: AppStateViewModel

    init(appState: AppStateViewModel) {
        self.appState = appState
    }

    func habits(for period: HabitPeriod) -> [Habit] {
        DateHelper.sortHabits(appState.habits.filter { $0.period == period && !$0.archived })
    }

    func toggleCompletion(for habit: Habit) {
        let today = DateHelper.startOfDay(Date())
        if let idx = appState.completions.firstIndex(where: { $0.habitID == habit.id && DateHelper.isSameDay($0.date, today) }) {
            appState.completions[idx].completed.toggle()
            appState.completions[idx].completedAt = appState.completions[idx].completed ? Date() : nil
        } else {
            appState.completions.append(.init(id: UUID(), habitID: habit.id, date: today, completed: true, completedAt: Date()))
        }
        appState.clarityState.todayCompletionRatio = ClarityEngine().completionRatio(on: Date(), habits: appState.habits, completions: appState.completions)
        appState.saveAll()
    }

    func isCompletedToday(_ habit: Habit) -> Bool {
        appState.completions.contains(where: { $0.habitID == habit.id && DateHelper.isSameDay($0.date, Date()) && $0.completed })
    }

    func upsertHabit(_ habit: Habit) {
        if let idx = appState.habits.firstIndex(where: { $0.id == habit.id }) {
            appState.habits[idx] = habit
        } else {
            appState.habits.append(habit)
        }
        appState.saveAll()
    }

    func deleteHabit(_ habit: Habit) {
        appState.habits.removeAll { $0.id == habit.id }
        appState.saveAll()
    }
}
