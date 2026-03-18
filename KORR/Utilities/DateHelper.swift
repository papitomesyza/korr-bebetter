import Foundation

enum DateHelper {
    static let calendar = Calendar.current

    static func startOfDay(_ date: Date) -> Date {
        calendar.startOfDay(for: date)
    }

    static func isSameDay(_ lhs: Date, _ rhs: Date) -> Bool {
        calendar.isDate(lhs, inSameDayAs: rhs)
    }

    static func hasNewDayStarted(since date: Date) -> Bool {
        !isSameDay(date, Date())
    }

    static func trailingDays(from date: Date, count: Int) -> [Date] {
        (0..<count).compactMap { calendar.date(byAdding: .day, value: -$0, to: startOfDay(date)) }
    }

    static func daysBetweenExclusive(from start: Date, to end: Date) -> [Date] {
        let normalizedStart = startOfDay(start)
        let normalizedEnd = startOfDay(end)
        guard normalizedStart < normalizedEnd else { return [] }

        var cursor = calendar.date(byAdding: .day, value: 1, to: normalizedStart) ?? normalizedEnd
        var days: [Date] = []

        while cursor < normalizedEnd {
            days.append(cursor)
            guard let next = calendar.date(byAdding: .day, value: 1, to: cursor) else { break }
            cursor = next
        }
        return days
    }

    static func timeString(from components: DateComponents?) -> String? {
        guard let components,
              let date = calendar.date(from: components) else { return nil }
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    static func sortHabits(_ habits: [Habit]) -> [Habit] {
        habits.sorted { lhs, rhs in
            switch (lhs.scheduledTime, rhs.scheduledTime) {
            case let (l?, r?):
                let lh = l.hour ?? 0, lm = l.minute ?? 0
                let rh = r.hour ?? 0, rm = r.minute ?? 0
                return lh == rh ? lm < rm : lh < rh
            case (_?, nil): return true
            case (nil, _?): return false
            case (nil, nil): return lhs.title < rhs.title
            }
        }
    }
}
