# Planto 🌱
### Plant Care & Watering Reminder App

**An iOS development project by Rafeef.**

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey?style=for-the-badge)

---

## Overview

Planto is a plant care app that helps users organize their plants and stay on top of their watering routines.

Users can add their plants, manage their care details, set watering frequencies, and monitor their daily progress — all in one place.

## Features

- **Plant Management** — Add, edit, and delete plants.
- **Plant Information** — Keep track of each plant's room, light requirements, watering frequency, and water amount.
- **Watering Reminders** — Receive local notifications based on watering schedules.
- **Daily Tracking** — Mark plants as watered and track completed tasks.
- **Progress Tracking** — View daily watering progress.
- **Completion State** — See a completion screen when all plants due for the day have been watered.
- **Dark Appearance** — A consistent dark interface.

## App Preview

<img width="2400" height="1200" alt="🖼️ App Thumbnail" src="https://github.com/user-attachments/assets/1f9c8259-17fb-4645-976f-2413c603e873" />



## Technologies

| Technology | Purpose |
|---|---|
| Swift | Main programming language |
| SwiftUI | Building the user interface |
| Foundation | Core data types and utilities |
| UserNotifications | Local notifications |

## Project Structure

```text
Planto/
├── Models/
│   └── Plant.swift
├── Services/
│   └── NotificationManager.swift
├── ViewModels/
│   └── PlantsViewModel.swift
├── Views/
│   ├── AllDoneView.swift
│   ├── ContentView.swift
│   ├── EmptyStateView.swift
│   ├── PlantFormView.swift
│   └── PlantRow.swift
├── Assets/
└── PlantsApp.swift
```

## Getting Started

### Requirements

- macOS
- Xcode
- iOS Simulator or a compatible iPhone

### Installation

1. Clone or download this repository.
2. Open the project in Xcode.
3. Select an iOS Simulator or connected device.
4. Build and run the app.
5. Allow notifications when prompted to receive watering reminders.

## Development

The development work focused on implementing the app's functionality using Swift and SwiftUI, organizing plant data, managing app state, and building the reminder functionality.

---

*Built with Swift and a little love for plants.*
