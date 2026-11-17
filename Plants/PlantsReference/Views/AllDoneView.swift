import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Image("plant")
                .resizable()
                .scaledToFit()
                .frame(width: 200)

            Text("All Done! 🎉")
                .font(.title2)
                .bold()

            Text("All Reminders Completed")
                .foregroundColor(.gray)

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
