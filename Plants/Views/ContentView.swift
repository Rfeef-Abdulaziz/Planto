import SwiftUI

struct ContentView: View {

    @State private var store = PlantViewModel()

    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Group {
            if store.hasStarted {
                RemindersView()
            } else {
                OnboardingView()
            }
        }
        .environment(store)
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                store.resetIfNewDay()
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
