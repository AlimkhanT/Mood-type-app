import SwiftUI

struct MoodDetailView: View {
    let moodEntry: MoodEntry

    var body: some View {
        VStack(spacing: 20) {
            Text(moodEntry.mood.rawValue)
                .font(.largeTitle)
            
            Text(moodEntry.date, style: .date)
                .font(.subheadline)
            
            if !moodEntry.notes.isEmpty {
                Text(moodEntry.notes)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Mood Details")
    }
}
