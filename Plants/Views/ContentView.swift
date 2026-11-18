import SwiftUI

struct ContentView: View {
    
    @State private var store = PlantViewModel()
    
    
    var body: some View {
        Group {
            if store.hasStarted {
                RemindersView()
            } else {
                OnboardingView()
            }
        }
        .environment(store)
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
