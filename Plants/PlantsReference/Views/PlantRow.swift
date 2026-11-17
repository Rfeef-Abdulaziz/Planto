import SwiftUI

struct PlantRow: View {
    let plant: Plant
    let onCheck: () -> Void   // يشتغل عند الضغط على الدائرة

    var body: some View {
        HStack(spacing: 14) {

            // دائرة التحديد
            Button {
                onCheck()
            } label: {
                if plant.isDoneToday {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "circle")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 6) {
                Label("in \(plant.room)", systemImage: "location")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(plant.name)
                    .font(.title2)

                HStack {
                    Label(plant.light, systemImage: "sun.max")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)

                    Label(plant.water, systemImage: "drop")
                        .font(.footnote)
                        .foregroundColor(.cyan)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
        }
        .opacity(plant.isDoneToday ? 0.6 : 1)
        .padding(.vertical, 6)
    }
}
