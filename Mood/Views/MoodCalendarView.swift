import SwiftUI

enum Mood: String, Codable {
    case happy, sad, angry, neutral

    var color: Color {
        switch self {
        case .happy: return .green
        case .sad: return .blue
        case .angry: return .red
        case .neutral: return .gray
        }
    }
}
struct MoodCalendarView: View {
    @Binding var selectedDate: Date
    var moodData: [Date: Mood]

    let daysInWeek = 7

    var body: some View {
        VStack {
            HStack {
                // Previous Month Button
                Button(action: {
                    let components = Calendar.current.dateComponents([.year, .month], from: selectedDate)
                    var newComponents = components
                    newComponents.month = (newComponents.month ?? 0) - 1
                    if let newDate = Calendar.current.date(from: newComponents) {
                        selectedDate = newDate
                    }
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }

                // Display current month and year
                Text("\(currentMonthAndYear())")
                    .font(.title)
                    .padding(.bottom, 10)

                // Next Month Button
                Button(action: {
                    let components = Calendar.current.dateComponents([.year, .month], from: selectedDate)
                    var newComponents = components
                    newComponents.month = (newComponents.month ?? 0) + 1
                    if let newDate = Calendar.current.date(from: newComponents) {
                        selectedDate = newDate
                    }
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            }

            // Days of the week header
            HStack {
                ForEach(Calendar.current.shortWeekdaySymbols, id: \.self) { weekday in
                    Text(weekday)
                        .frame(maxWidth: .infinity)
                }
            }

            // Calendar grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: daysInWeek)) {
                ForEach(daysInMonth(), id: \.self) { date in
                    let mood = moodData[date]
                    let isSelected = Calendar.current.isDate(date, inSameDayAs: selectedDate)

                    DayView(date: date, mood: mood, isSelected: isSelected, onDateSelected: { selectedDate = $0 })
                }
            }
        }
    }

    // Get all days of the current month
    func daysInMonth() -> [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: selectedDate)!

        // Determine the first day of the month
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!

        // Create a list of all days in the month
        var days: [Date] = []

        for day in 1...range.count {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) {
                days.append(date)
            }
        }

        return days
    }

    // Get the month and year string
    func currentMonthAndYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: selectedDate)
    }
}

struct DayView: View {
    var date: Date
    var mood: Mood?
    var isSelected: Bool
    var onDateSelected: (Date) -> Void

    var body: some View {
        ZStack {
            if isSelected {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.blue, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.2)))
                    .padding(4)
            } else {
                mood?.color.opacity(0.5)
                    .cornerRadius(8)
                    .padding(4)
            }

            Text("\(dayOfMonth())")
                .foregroundColor(isSelected ? .white : .black)
                .fontWeight(.bold)
        }
        .frame(width: 40, height: 40)
        .onTapGesture {
            onDateSelected(date.startOfDay())
        }
    }

    func dayOfMonth() -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
}

extension Date {
    func startOfDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
}
