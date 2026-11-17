import SwiftUI

@main
struct PlantsApp: App {
    init() {
        // نطلب إذن الإشعارات عند فتح التطبيق
        NotificationManager.requestPermission()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
