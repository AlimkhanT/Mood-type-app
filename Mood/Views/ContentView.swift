import SwiftUI

struct ContentView: View {
    @StateObject private var moodTrackerViewModel = ChartViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

              
                NavigationLink(destination: MoodEntryView(viewModel: MoodEntryViewModel(onSave: { mood, notes in
                    moodTrackerViewModel.addMoodEntry(mood: mood, notes: notes)
                }))) {
                    Text("Add New Mood")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                NavigationLink(destination: MoodChartView(viewModel: moodTrackerViewModel)) {
                    Text("Mood Trends")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Mood Tracker")
        }
    }
}
