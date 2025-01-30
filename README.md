# 📱 MediMood

**MediMood** is a medication reminder and tracking app designed to help users manage their medication schedules effectively. It allows users to organize their pills into different time periods, add notes about their progress, and stay on top of their health routines.

---

## ✨ Features
- **Onboarding Screens**: A smooth onboarding experience to guide new users.
- **Medication Scheduling**: Organize your pills into different time periods (morning, afternoon, evening, etc.).
- **Progress Tracking**: Add notes about your health condition and progress.
- **Reminders**: Get timely reminders to take your medication.
- **User-Friendly Interface**: Simple and intuitive design for easy navigation.
- **Notifications**: Send notifications in schedule time.

---

## 🛠 Technologies Used
- **Flutter**: For building a cross-platform app.
- **State Management**: [Bloc](https://pub.dev/packages/flutter_bloc) for state management.
- **Local Storage**: [Hive](https://pub.dev/packages/hive) for storing medication data locally.
- **Notifications**: [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) for scheduling reminders.

---

## 📁 Folder Structure
The app follows the **MVVM (Model-View-ViewModel)** architecture. Here's the folder structure:
```
lib/
├── core/
│ ├── utils/ # Utility functions and helpers
│ ├── services/ # Services (e.g., notification service)
│ └── error/ # Error handling and custom exceptions
├── features/
│ ├── home/ # Home screen feature
│ │ ├── data/ # Data layer (repos, models)
│ │ └── presentation/ # Presentation layer (views, manager)
│ │ ├── views/ # UI components
│ │ └── manager/ # Cubits for state management
│ ├── note/ # Notes feature
│ │ ├── data/
│ │ └── presentation/
│ ├── onboarding/ # Onboarding feature
│ │ ├── data/
│ │ └── presentation/
│ └── splash/ # Splash screen feature
│ ├── data/
│ └── presentation/
├── simple_bloc_opserver.dart # bloc orserver
└── main.dart # App entry point
```
## OS Support

At present, we officially aim to support the last two versions of the following operating systems:

[<img src="https://raw.githubusercontent.com/creativetimofficial/ct-material-kit-pro-react-native/master/assets/android-logo.png" width="60" height="60" />](https://www.creative-tim.com/product/now-ui-pro-react-native)[<img src="https://raw.githubusercontent.com/creativetimofficial/ct-material-kit-pro-react-native/master/assets/apple-logo.png" width="60" height="60" />](https://www.creative-tim.com/product/now-ui-pro-react-native)

