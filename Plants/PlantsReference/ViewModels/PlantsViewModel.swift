import SwiftUI
import Combine

// ViewModel: يدير قائمة النباتات والعمليات عليها
class PlantsViewModel: ObservableObject {

    // أي تغيير في القائمة يحدّث الشاشة ويحفظ البيانات
    @Published var plants: [Plant] = [] {
        didSet { save() }
    }

    init() {
        load()
    }

    // النباتات اللي تظهر اليوم
    var todayPlants: [Plant] {
        plants.filter { $0.isDueToday || $0.isDoneToday }
    }

    // كم نبتة انسقت
    var doneCount: Int {
        todayPlants.filter { $0.isDoneToday }.count
    }

    // هل خلصت كل التذكيرات؟
    var allDone: Bool {
        todayPlants.isEmpty || doneCount == todayPlants.count
    }

    // إضافة
    func addPlant(_ plant: Plant) {
        plants.append(plant)
        NotificationManager.schedule(for: plant)
    }

    // تعديل
    func updatePlant(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index] = plant
            NotificationManager.schedule(for: plant)
        }
    }

    // حذف
    func deletePlant(_ plant: Plant) {
        plants.removeAll(where: { $0.id == plant.id })
        NotificationManager.cancel(for: plant)
    }

    // تحديد / إلغاء تحديد السقاية
    func toggleDone(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            if plants[index].isDoneToday {
                plants[index].lastWatered = nil
            } else {
                plants[index].lastWatered = Date()
            }
        }
    }

    // حفظ البيانات في الجهاز
    func save() {
        if let data = try? JSONEncoder().encode(plants) {
            UserDefaults.standard.set(data, forKey: "plants")
        }
    }

    // قراءة البيانات المحفوظة
    func load() {
        if let data = UserDefaults.standard.data(forKey: "plants"),
           let saved = try? JSONDecoder().decode([Plant].self, from: data) {
            plants = saved
        }
    }
}
