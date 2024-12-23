import Foundation

class MoodTrackerViewModel: ObservableObject {
    @Published var moodEntries: [MoodEntry] = []
    
    // Add a new mood entry
    func addMoodEntry(mood: Mood, notes: String) {
        let newEntry = MoodEntry(date: Date(), mood: mood, notes: notes)
        moodEntries.append(newEntry)
    }
}
