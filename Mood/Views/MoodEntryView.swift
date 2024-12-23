import SwiftUI

struct MoodEntryView: View {
    @ObservedObject var viewModel: MoodEntryViewModel
    @State private var selectedMood: Mood = .happy
    @State private var notes: String = ""
    
    var body: some View {
        VStack {
            Picker("Mood", selection: $selectedMood) {
                Text("Happy😁").tag(Mood.happy)
                Text("Neutral😐").tag(Mood.neutral)
                Text("Sad☹️").tag(Mood.sad)
                Text("Angry😡").tag(Mood.angry)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TextField("Notes", text: $notes)
                .padding()
                .border(Color.gray, width: 1)
                .padding(.horizontal)
            
            Button("Save Mood") {
                viewModel.onSave(selectedMood, notes)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
