# Planto 🌱
### Plant Care & Watering Reminder App

**An iOS development project by Rafeef.**
Built with SwiftUI for the Apple Developer Academy challenge.

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-iOS%2026-lightgrey?style=for-the-badge)

---

## Overview

Planto helps users organize their plants and stay on top of their watering routines.
Users can add their plants, set each plant's care details, get watering reminders, and track their daily progress in one place.

## Features

- **Plant Management:** add, edit, and delete plants (swipe to delete, or delete from the edit sheet).
- **Plant Information:** room, light requirements, watering frequency, and water amount for each plant.
- **Watering Reminders:** local notifications scheduled from each plant's watering frequency.
- **Daily Tracking:** mark a plant as watered; the check resets automatically the next day.
- **Progress Tracking:** a custom progress message and bar showing how many plants were watered.
- **Completion State:** an "All Done" screen once every plant has been watered.
- **Empty States:** a welcome screen for new users and a message when no reminders are set.
- **Data Persistence:** plants are saved on the device and are still there after closing the app.
- **Design:** an always-dark interface and Liquid Glass buttons, following the academy's design.

## Architecture (MVVM)

The app is split into three layers, and each layer has one job:

| Layer | File | Responsibility |
|---|---|---|
| **Model** | `Plant.swift` | The data of a plant and its options (`Room`, `Light`, `WateringDays`, `WaterAmount`) |
| **ViewModel** | `PlantViewModel.swift` | Add, update, delete, and mark plants as watered; progress calculation; saving and loading |
| **View** | `Views/` | Shows the data and asks the ViewModel to change it; contains no data logic |

Views never change the data themselves. For example, tapping the circle calls `toggleWatered`
in the ViewModel, which updates the plant and saves. The `@Observable` macro then refreshes the screen.

A plant stores only the date it was last watered (`lastWatered`). Whether it counts as watered today
is calculated from that date, so no daily reset code is needed.

## Technologies

| Technology | Purpose |
|---|---|
| Swift | Main programming language |
| SwiftUI | Building the user interface |
| Observation (`@Observable`) | Updating the screen when data changes |
| UserDefaults + Codable | Saving plants locally |
| UserNotifications | Local watering reminders |

## Project Structure

```text
Plants/
├── Models/
│   └── Plant.swift
├── ViewModels/
│   └── PlantViewModel.swift
├── Views/
│   ├── ContentView.swift
│   ├── OnboardingView.swift
│   ├── RemindersView.swift
│   ├── PlantRow.swift
│   ├── SetReminderView.swift
│   └── AllDoneView.swift
├── Services/
│   └── NotificationManager.swift
├── Assets.xcassets
├── Planto.icon
└── MyApp.swift
```

## Getting Started

### Requirements

- macOS with **Xcode 26** or later
- iOS 26 or later (required for the Liquid Glass button styles)
- iOS Simulator or a compatible iPhone

### Installation

1. Clone or download this repository.
2. Open `Plants.xcodeproj` in Xcode.
3. Select an iPhone simulator or a connected device.
4. Build and run the app (⌘R).
5. Allow notifications when prompted to receive watering reminders.

## Acknowledgments

This project started from a reference project and was then adapted, simplified, and reorganized
step by step to match the academy's design and requirements. An AI assistant (Claude) was used as a
learning aid during development.

---

*Built with Swift and a little love for plants.*
