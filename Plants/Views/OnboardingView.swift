import SwiftUI

struct OnboardingView: View {

    @State private var showSheet = false

    var body: some View {
        VStack(alignment: .leading) {

            Text("My Plants 🌱")
                .font(.largeTitle)
                .bold()

            Divider()

            Spacer()

            VStack(spacing: 16) {
                Image("plantStart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 220)
                Text("Start your plant journey!")
                    .font(.system(size: 22))
                    .bold()

                Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                Button {
                    showSheet = true
                } label: {
                    Text("Set Plant Reminder")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.glassProminent)
                .tint(Color("PlantGreen"))
                .controlSize(.large)
                .padding(.horizontal, 70)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity)

            Spacer()
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            SetReminderView()
        }
    }
}

#Preview {
    OnboardingView()
        .environment(PlantViewModel())
        .preferredColorScheme(.dark)
}
