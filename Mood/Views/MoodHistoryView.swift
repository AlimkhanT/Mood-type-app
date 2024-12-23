import SwiftUI

struct MoodHistoryView: View {
    var moodEntries: [MoodEntry]

    var body: some View {
        List(moodEntries) { entry in
            VStack(alignment: .leading) {
                Text(entry.date, style: .date)
                Text(entry.mood.rawValue.capitalized)
                Text(entry.notes)
                
                if let image = entry.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}
