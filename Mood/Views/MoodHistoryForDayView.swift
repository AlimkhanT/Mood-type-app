import SwiftUI

struct MoodHistoryForDayView: View {
    var date: Date
    var moodEntries: [MoodEntry]

    var body: some View {
        VStack {
            Text("Mood History for \(formattedDate(date))")
                .font(.title)
                .padding()

            List(moodEntries) { entry in
                VStack(alignment: .leading) {
                    Text(entry.mood.rawValue)
                        .font(.headline)
                    Text(entry.notes)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            
            Spacer()
        }
        .navigationTitle("Mood History")
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
