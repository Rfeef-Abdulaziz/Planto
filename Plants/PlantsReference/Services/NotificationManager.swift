import UserNotifications

struct NotificationManager {

    // طلب الإذن من المستخدم
    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    // جدولة إشعار يتكرر كل عدد أيام السقاية
    static func schedule(for plant: Plant) {
        cancel(for: plant)

        let content = UNMutableNotificationContent()
        content.title = "Time to water \(plant.name) 💦"
        content.body = "\(plant.water) in the \(plant.room)"
        content.sound = .default

        let seconds = Double(plant.daysBetween * 24 * 60 * 60)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)
        let request = UNNotificationRequest(identifier: plant.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

    // إلغاء إشعار نبتة (عند الحذف)
    static func cancel(for plant: Plant) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
    }
}
