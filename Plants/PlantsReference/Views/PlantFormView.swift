import SwiftUI

struct PlantFormView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: PlantsViewModel
    var plant: Plant?   // nil = إضافة جديدة، فيه قيمة = تعديل

    @State var name = ""
    @State var room = "Bedroom"
    @State var light = "Full Sun"
    @State var wateringDays = "Every day"
    @State var water = "20-50 ml"

    var body: some View {
        VStack(spacing: 24) {

            // الشريط العلوي: X - العنوان - ✓
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                }

                Spacer()
                Text("Set Reminder").bold()
                Spacer()

                Button {
                    save()
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(Color("PlantGreen"))
                        .clipShape(Circle())
                }
                .disabled(name.isEmpty)
            }
            .foregroundColor(.primary)

            // اسم النبتة
            HStack {
                Text("Plant Name")
                TextField("Pothos", text: $name)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(Capsule())

            // Room + Light
            VStack {
                Picker(selection: $room) {
                    ForEach(PlantOptions.rooms, id: \.self) { Text($0) }
                } label: {
                    Label("Room", systemImage: "location")
                }
                Divider()
                Picker(selection: $light) {
                    ForEach(PlantOptions.lights, id: \.self) { Text($0) }
                } label: {
                    Label("Light", systemImage: "sun.max")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(24)

            // Watering Days + Water
            VStack {
                Picker(selection: $wateringDays) {
                    ForEach(PlantOptions.wateringDays, id: \.self) { Text($0) }
                } label: {
                    Label("Watering Days", systemImage: "drop")
                }
                Divider()
                Picker(selection: $water) {
                    ForEach(PlantOptions.waterAmounts, id: \.self) { Text($0) }
                } label: {
                    Label("Water", systemImage: "drop")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(24)

            // زر الحذف يظهر فقط عند التعديل
            if let plant = plant {
                Button {
                    viewModel.deletePlant(plant)
                    dismiss()
                } label: {
                    Text("Delete Reminder")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                }
            }

            Spacer()
        }
        .padding()
        .onAppear {
            // عند التعديل نعبي الحقول ببيانات النبتة
            if let plant = plant {
                name = plant.name
                room = plant.room
                light = plant.light
                wateringDays = plant.wateringDays
                water = plant.water
            }
        }
    }

    func save() {
        if var existing = plant {
            existing.name = name
            existing.room = room
            existing.light = light
            existing.wateringDays = wateringDays
            existing.water = water
            viewModel.updatePlant(existing)
        } else {
            let newPlant = Plant(name: name, room: room, light: light,
                                 wateringDays: wateringDays, water: water)
            viewModel.addPlant(newPlant)
        }
        dismiss()
    }
}
