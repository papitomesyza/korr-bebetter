import SwiftUI

struct AddHabitSheet: View {
    @Environment(\.dismiss) private var dismiss
    let existing: Habit?
    let onSave: (Habit) -> Void

    @State private var title = ""
    @State private var period: HabitPeriod = .morning
    @State private var hasTime = false
    @State private var time = Date()
    @State private var difficulty: DifficultyWeight = .standard

    var body: some View {
        NavigationStack {
            Form {
                Section("Habit") { TextField("Title", text: $title) }
                Section("Schedule") {
                    Picker("Period", selection: $period) {
                        ForEach(HabitPeriod.allCases) { p in Text(p.title).tag(p) }
                    }
                    Toggle("Exact Time", isOn: $hasTime)
                    if hasTime { DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute) }
                }
                Section("Intensity") {
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(DifficultyWeight.allCases) { w in Text(w.title).tag(w) }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle(existing == nil ? "New Habit" : "Edit Habit")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let c = Calendar.current.dateComponents([.hour, .minute], from: time)
                        let habit = Habit(id: existing?.id ?? UUID(), title: title, period: period,
                                         scheduledTime: hasTime ? c : nil,
                                         isSuggested: existing?.isSuggested ?? false,
                                         isCustom: true,
                                         icon: existing?.icon,
                                         difficultyWeight: difficulty,
                                         repeatConfiguration: nil,
                                         createdAt: existing?.createdAt ?? Date(),
                                         archived: false)
                        onSave(habit)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .onAppear {
                guard let existing else { return }
                title = existing.title
                period = existing.period
                difficulty = existing.difficultyWeight
                hasTime = existing.scheduledTime != nil
                if let components = existing.scheduledTime,
                   let date = Calendar.current.date(from: components) {
                    time = date
                }
            }
        }
    }
}
