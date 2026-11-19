import SwiftUI

// 📋 الشاشة الرئيسية
struct RemindersView: View {

    @Environment(PlantViewModel.self) var store

    @State private var showSheet = false
    @State private var plantToEdit: Plant? = nil

    var body: some View {
        VStack(alignment: .leading) {

            Text("My Plants 🌱")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)

            Divider()

            if store.plants.isEmpty {
                Spacer()
                Text("No reminders set yet..")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
                Spacer()

            } else if store.allDone {
                AllDoneView()

            } else {
                VStack(spacing: 10) {
                    Text(store.progressText)
                        .font(.subheadline)

                    ProgressView(value: Double(store.wateredCount), 
                                 total: Double(store.plants.count))
                        .tint(Color("PlantGreen"))
                }
                .frame(maxWidth: .infinity)
                .padding()

                List {
                    ForEach(store.plants) { plant in
                        PlantRow(plant: plant) {
                            store.toggleWatered(plant)
                        }
                        .listRowSeparatorTint(Color("RowSeparator"))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            plantToEdit = plant
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    store.delete(plant)
                                }
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                showSheet = true
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(8)
                        }
            .buttonStyle(.glassProminent)
            .buttonBorderShape(.circle)
            .tint(Color("PlantGreen"))
            .padding()
        }
        .sheet(isPresented: $showSheet) {
            SetReminderView()
        }
        .sheet(item: $plantToEdit) { plant in
            SetReminderView(plantToEdit: plant)
        }
    }
}

// 🪴 صف نبتة وحدة
struct PlantRow: View {

    let plant: Plant
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            Button {
                withAnimation {
                    onToggle()
                }
            } label: {
                Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(plant.isWatered ? Color("CheckGreen") : Color("SecondaryGray"))
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 6) {

                Label("in \(plant.room.rawValue)", systemImage: "location")
                    .font(.caption)
                    .foregroundStyle(Color("SecondaryGray"))

                Text(plant.name)
                    .font(.title3)

                HStack {
                    Label(plant.light.rawValue, systemImage: plant.light.icon)
                        .font(.caption)
                        .foregroundStyle(Color("SunYellow"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color("ChipBackground"))
                        .clipShape(Capsule())

                    Label(plant.water.rawValue, systemImage: "drop")
                        .font(.caption)
                        .foregroundStyle(Color("WaterBlue"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color("ChipBackground"))
                        .clipShape(Capsule())
                }
            }
            .opacity(plant.isWatered ? 0.6 : 1)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    RemindersView()
        .environment(PlantViewModel())
        .preferredColorScheme(.dark)
}
