
import Foundation

// 🥕 Model: معلومات نبتة وحدة
struct Plant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var room: Room
    var light: Light
    var wateringDays: WateringDays
    var water: WaterAmount
    var isWatered = false
}
