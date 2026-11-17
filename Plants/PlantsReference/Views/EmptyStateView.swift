import SwiftUI

struct EmptyStateView: View {
    @Binding var showAddSheet: Bool

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Image("plant")
                .resizable()
                .scaledToFit()
                .frame(width: 200)

            Text("Start your plant journey!")
                .font(.title2)
                .bold()

            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()

            Button {
                showAddSheet = true
            } label: {
                Text("Set Plant Reminder")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("PlantGreen"))
                    .clipShape(Capsule())
            }
            .padding(.horizontal, 48)
            .padding(.bottom, 60)
        }
    }
}
