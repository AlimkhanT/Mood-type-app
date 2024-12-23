import SwiftUI

class MoodEntryViewModel: ObservableObject {
    var onSave: (Mood, String) -> Void
    
    init(onSave: @escaping (Mood, String) -> Void) {
        self.onSave = onSave
    }
}
