


###
## Study Planner – Flutter Mobile Application


## 1. Project Overview

**Study Planner** is a mobile application developed using **Flutter and Dart** to help students organize their academic activities, manage study goals, track planned study hours, and monitor their learning progress.

The application provides a simple and user-friendly interface where students can create study goals, mark tasks as completed, delete unnecessary goals, and view their study statistics.

To ensure data persistence, the application uses **SQLite** as a local database. This allows study goals to remain saved even after the application is closed or restarted.

**Project Information**

- **Project Name:** Study Planner
- **Course:** Mobile Application Development (Dart & Flutter)
- **Institution:** University of Lay Adventists of Kigali (UNILAK)
- **Faculty:** Computing and Information Sciences
- **Group Number:** 7
- **Database:** SQLite
- **Platform:** Android and iOS

## 2. Project Objectives

The main objectives of this application are to:

1. Help students organize their daily study activities.
2. Allow students to create and manage study goals.
3. Track planned study hours and completed tasks.
4. Improve time management and study discipline.
5. Monitor academic progress through statistics.
6. Store study information locally for future access.

## 3. Key Features

The Study Planner application provides the following features:

- **Add Study Goals:** Create new study goals by entering a subject and planned study hours.
- **Input Validation:** Validate user information before saving a study goal.
- **View Study Goals:** Display all saved study goals.
- **Mark as Completed:** Mark study goals as completed.
- **Undo Completion:** Change completed goals back to pending.
- **Delete Goals:** Remove study goals that are no longer needed.
- **Study Statistics:** Display real-time statistics about study progress.
- **Progress Tracking:** Monitor completed and pending study goals.
- **Empty State Message:** Display a helpful message when no study goals exist.
- **Local Database:** Save and retrieve study goals using SQLite.
- **Data Persistence:** Keep saved study goals available after closing and reopening the application.

## 4. Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Mobile application development framework |
| Dart | Main programming language |
| SQLite | Local relational database |
| sqflite | SQLite database integration in Flutter |
| path | Database path management |
| Android Studio | Android emulator and SDK support |
| Visual Studio Code | Code development and project management |
| Git | Version control |
| GitHub | Source code hosting and collaboration |

## 5. Project Development Phases

The project was developed through the following phases:

| Phase | Description |
|---|---|
| Phase 1: Static Screen | Designed the initial application interface. |
| Phase 2: Working List | Implemented adding, completing, and deleting study goals. |
| Phase 3: Statistics & Cards | Added study statistics and progress cards. |
| Phase 4: Second Screen | Created the goal creation screen with form validation. |
| Phase 5: Database Persistence | Integrated SQLite to store and retrieve study goals. |

## 6. Application Screens and Functionality

The application is designed around the following main functionalities:

**1. Home Screen**
- Displays the study planner dashboard.
- Shows available study goals.
- Displays study progress and statistics.
- Provides access to study activities.

**2. Add Goal Screen**
- Allows students to enter a subject.
- Allows students to specify planned study hours.
- Validates user input before saving.

**3. Study Goal Management**
- Displays saved study goals.
- Allows users to mark goals as completed.
- Supports undoing completed goals.
- Allows users to delete goals.

**4. Database Management**
- Saves study goals locally.
- Retrieves saved records when the application starts.
- Updates completion status.
- Deletes unwanted records.

## 7. Project Structure

The main project files are organized as follows:

```text
Group_7_Study_Planner/
│
├── android/
│
├── ios/
│
├── lib/
│   ├── main.dart
│   └── database_helper.dart
│
├── test/
│
├── pubspec.yaml
│
├── pubspec.lock
│
├── analysis_options.yaml
│
└── README.md
```

**Important Files:**

- `main.dart`: Contains the main application entry point, user interface, and application functionality.
- `database_helper.dart`: Handles SQLite database initialization and database operations.
- `pubspec.yaml`: Defines project dependencies and configuration.
- `README.md`: Provides project documentation and installation instructions.

## 8. Database Design

The application uses SQLite for local data storage.

**Database Name:** `goals.db`

**Table Name:** `goals`

### Database Table Structure

| Column | Data Type | Description |
|---|---|---|
| id | INTEGER | Primary key and unique goal identifier |
| subject | TEXT | Name of the study subject |
| hours | INTEGER | Planned study hours |
| done | INTEGER | Completion status (0 = Not Done, 1 = Done) |

### Database Operations (CRUD)

The application supports the four fundamental database operations:

1. **Create:** Add new study goals to the database.
2. **Read:** Retrieve and display saved study goals.
3. **Update:** Change the completion status of study goals.
4. **Delete:** Remove study goals from the database.

## 9. Installation and Execution

Follow these steps to download and run the application.

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK (included with Flutter)
- Visual Studio Code or Android Studio
- Android SDK and an Android emulator, or a physical Android device
- Git

### Step 1: Clone the Repository

Open your terminal or VS Code terminal and execute:

```bash
git clone https://github.com/izabayonazer-hash/Group_7_Study_Planner.git
```

### Step 2: Navigate to the Project Directory

```bash
cd Group_7_Study_Planner
```

### Step 3: Install Dependencies

```bash
flutter pub get
```

### Step 4: Check Flutter Configuration

```bash
flutter doctor
```

### Step 5: Run the Application

Connect an Android device or start an Android emulator, then execute:

```bash
flutter run
```

### Step 6: Build an APK (Optional)

To generate an Android APK file:

```bash
flutter build apk --release
```

The generated APK can be found in:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## 10. Important Notes

- The application uses SQLite for local database storage.
- Study goals are stored locally on the device.
- The standard `sqflite` implementation supports Android and iOS.
- An Android emulator or physical Android device is recommended for testing.
- An internet connection is not required for normal local database operations.

## 11. Group Information

**Group Number: 7**

| No. | Registration Number |
|---|---|
| 1 | 26495/2024 |
| 2 | 27087/2024 |
| 3 | 27130/2024 |
| 4 | 26455/2024 |
| 5 | 27869/2024 |

**Institution:** University of Lay Adventists of Kigali (UNILAK)

**Course:** Mobile Application Development (Dart & Flutter)

## 12. GitHub Repository

The complete project source code is hosted on GitHub.

**Repository:** [Group_7_Study_Planner](https://github.com/izabayonazer-hash/Group_7_Study_Planner)

Clone the repository:

```bash
git clone https://github.com/izabayonazer-hash/Group_7_Study_Planner.git
```

## 13. Expected Learning Outcomes

Through this project, students demonstrate practical knowledge of:

- Flutter mobile application development.
- Dart programming concepts.
- User interface design and navigation.
- Form handling and input validation.
- State management and interactive components.
- SQLite database integration.
- CRUD operations.
- Mobile application testing.
- Git and GitHub version control.

## 14. Conclusion

The **Study Planner** application provides students with a practical solution for organizing their study activities and monitoring academic progress.

By combining Flutter, Dart, and SQLite, the project demonstrates how mobile technologies can be used to develop useful applications that solve everyday academic challenges.

The project was developed as a **Mobile Application Development Final Project at the University of Lay Adventists of Kigali (UNILAK), Group 7**.

---

**Developed by Group 7**

*University of Lay Adventists of Kigali (UNILAK)*

**Plan Smarter. Study Better. Achieve More.**
