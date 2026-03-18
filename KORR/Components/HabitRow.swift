import SwiftUI

struct HabitRow: View {
    let habit: Habit
    let isCompleted: Bool
    let toggle: () -> Void

    var body: some View {
        Button(action: toggle) {
            HStack(spacing: 12) {
                Image(systemName: habit.icon ?? "circle")
                    .frame(width: 24)
                    .foregroundStyle(.white.opacity(0.8))
                VStack(alignment: .leading, spacing: 4) {
                    Text(habit.title).foregroundStyle(.white)
                    if let time = DateHelper.timeString(from: habit.scheduledTime) {
                        Text(time).font(.caption).foregroundStyle(.white.opacity(0.55))
                    }
                }
                Spacer()
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(isCompleted ? .white : .white.opacity(0.3))
            }
            .padding()
            .background(Color.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.12), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}
