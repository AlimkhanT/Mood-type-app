import Foundation
import SwiftUI

class ChartViewModel: ObservableObject {
    @Published var moodEntries: [MoodEntry] = []

    // Add a new mood entry
    func addMoodEntry(mood: Mood, notes: String, date: Date = Date()) {
        let newEntry = MoodEntry(date: date, mood: mood, notes: notes)
        moodEntries.append(newEntry)
    }

    // Filter mood entries for a specific day
    func moodEntriesForDay(_ date: Date) -> [MoodEntry] {
        let calendar = Calendar.current
        return moodEntries.filter {
            calendar.isDate($0.date, inSameDayAs: date)
        }
    }

    // Get mood data for calendar (for each day, store the corresponding mood)
    func moodDataForCalendar() -> [Date: Mood] {
        var moodData: [Date: Mood] = [:]
        let calendar = Calendar.current
        
        for entry in moodEntries {
            let dayStart = calendar.startOfDay(for: entry.date)
            moodData[dayStart] = entry.mood
        }
        
        return moodData
    }
}
