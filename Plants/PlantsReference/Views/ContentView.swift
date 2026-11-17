import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PlantsViewModel()
    @State var showAddSheet = false
    @State var plantToEdit: Plant? = nil

    var body: some View {
        ZStack(alignment: .bottomTrailing) {

            VStack(alignment: .leading) {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Divider()

                if viewModel.plants.isEmpty {
                    EmptyStateView(showAddSheet: $showAddSheet)
                } else if viewModel.allDone {
                    AllDoneView()
                } else {
                    plantsList
                }
            }

            // زر الإضافة (يظهر لما يكون عندنا نباتات)
            if !viewModel.plants.isEmpty {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color("PlantGreen"))
                        .clipShape(Circle())
                }
                .padding()
            }
        }
        .sheet(isPresented: $showAddSheet) {
            PlantFormView(viewModel: viewModel, plant: nil)
        }
        .sheet(item: $plantToEdit) { plant in
            PlantFormView(viewModel: viewModel, plant: plant)
        }
    }

    // القائمة + شريط التقدم
    var plantsList: some View {
        VStack {
            if viewModel.doneCount == 0 {
                Text("Your plants are waiting for a sip 💦")
                    .padding(.top)
            } else {
                Text("\(viewModel.doneCount) of your plants feel loved today ✨")
                    .padding(.top)
            }

            ProgressView(value: Double(viewModel.doneCount),
                         total: Double(viewModel.todayPlants.count))
                .tint(Color("PlantGreen"))
                .padding(.horizontal, 32)
                .padding(.bottom)

            List {
                ForEach(viewModel.todayPlants) { plant in
                    PlantRow(plant: plant) {
                        viewModel.toggleDone(plant)
                    }
                    .onTapGesture {
                        plantToEdit = plant
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deletePlant(plant)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
