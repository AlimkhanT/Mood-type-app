import SwiftUI

struct MoodChartView: View {
    @ObservedObject var viewModel: ChartViewModel
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack {
            MoodCalendarView(selectedDate: $selectedDate, moodData: viewModel.moodDataForCalendar())

            MoodHistoryView(moodEntries: viewModel.moodEntriesForDay(selectedDate))
                .padding()
        }
        .navigationTitle("Mood Tracker")
    }
}
