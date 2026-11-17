import Foundation

// الخيارات المطلوبة من الأكاديمية
struct PlantOptions {
    static let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    static let lights = ["Full Sun", "Partial Sun", "Low Light"]
    static let wateringDays = ["Every day", "Every 2 days", "Every 3 days",
                               "Once a week", "Every 10 days", "Every 2 weeks"]
    static let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
}

// Model: شكل بيانات النبتة
struct Plant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var room: String
    var light: String
    var wateringDays: String
    var water: String
    var lastWatered: Date? = nil   // آخر مرة انسقت فيها

    // كم يوم بين كل سقاية؟
    var daysBetween: Int {
        switch wateringDays {
        case "Every day": return 1
        case "Every 2 days": return 2
        case "Every 3 days": return 3
        case "Once a week": return 7
        case "Every 10 days": return 10
        case "Every 2 weeks": return 14
        default: return 1
        }
    }

    // هل انسقت اليوم؟
    var isDoneToday: Bool {
        if let last = lastWatered {
            return Calendar.current.isDateInToday(last)
        }
        return false
    }

    // هل عليها تذكير اليوم؟
    var isDueToday: Bool {
        guard let last = lastWatered else { return true }
        let from = Calendar.current.startOfDay(for: last)
        let to = Calendar.current.startOfDay(for: Date())
        let days = Calendar.current.dateComponents([.day], from: from, to: to).day ?? 0
        return days >= daysBetween
    }
}
