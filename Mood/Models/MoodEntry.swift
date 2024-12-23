import SwiftUI


// MoodEntry now conforms to Identifiable
struct MoodEntry: Identifiable {
    var id: UUID = UUID() // Unique identifier for each MoodEntry
    var date: Date
    var mood: Mood
    var notes: String
    var image: UIImage? // Optional image for the mood
}
