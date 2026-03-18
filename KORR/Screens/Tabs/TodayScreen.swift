import SwiftUI

struct TodayScreen: View {
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    header
                    GlassCard {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Today's Clarity").foregroundStyle(.white.opacity(0.7))
                            Text("\(Int(viewModel.appState.clarityState.clarityScore))%")
                                .font(.title.bold())
                                .foregroundStyle(.white)
                        }
                    }

                    ForEach(HabitPeriod.allCases) { period in
                        VStack(alignment: .leading, spacing: 10) {
                            SectionHeader(title: period.title)
                            let periodHabits = viewModel.habits(for: period)
                            if periodHabits.isEmpty {
                                Text("No habits configured.").foregroundStyle(.white.opacity(0.45)).padding(.vertical, 8)
                            }
                            ForEach(periodHabits) { habit in
                                HabitRow(habit: habit,
                                         isCompleted: viewModel.isCompletedToday(habit),
                                         toggle: { viewModel.toggleCompletion(for: habit) })
                                .contextMenu {
                                    Button("Edit") { viewModel.editingHabit = habit }
                                    Button("Delete", role: .destructive) { viewModel.deleteHabit(habit) }
                                }
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        SectionHeader(title: "Suggested")
                        ForEach(HabitLibrary.suggestedHabits.filter { s in !viewModel.appState.habits.contains(where: { $0.title == s.title }) }.prefix(5)) { habit in
                            Button {
                                viewModel.upsertHabit(habit)
                            } label: {
                                HStack {
                                    Text(habit.title)
                                    Spacer()
                                    Image(systemName: "plus")
                                }
                                .padding()
                                .background(Color.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 14))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Today")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { viewModel.showingAddSheet = true }) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingAddSheet) {
                AddHabitSheet(existing: nil, onSave: viewModel.upsertHabit)
            }
            .sheet(item: $viewModel.editingHabit) { habit in
                AddHabitSheet(existing: habit, onSave: viewModel.upsertHabit)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(Date(), format: .dateTime.weekday(.wide).month().day())
                .foregroundStyle(.white.opacity(0.75))
            Text("Maintain the line. Keep pace restrained.")
                .font(.title3.weight(.medium))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
