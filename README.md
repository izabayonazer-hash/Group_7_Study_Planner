#  My Study Planner — Flutter & Dart Final Project

**Group Number:** 7

##  Group Registration Numbers

| No. | Registration Number |
| --- | ------------------- |
| 1   | 26495/2024          |
| 2   | 27087/2024          |
| 3   | 27130/2024          |
| 4   | 26455/2024          |
| 5   | 27                  |

---

##  Project Description

**My Study Planner** is a Flutter mobile application developed to help students organize their study goals, manage study hours, and monitor their academic progress.

The application allows students to add study goals, mark tasks as completed, delete goals, view study statistics, and save their information using an SQLite database.

## Project Development Phases

### Phase 1: Static Screen

- Created a Flutter project named `study_planner`.
- Used `MaterialApp`, `Scaffold`, and `StatelessWidget`.
- Added an AppBar with the title **My Study Planner**.
- Created at least three study goal cards using `Card` and `ListTile`.
- Added a heading and Floating Action Button (FAB).
- Included `STATIC` comments above major widget sections.

### Phase 2: Working List

- Converted the main screen into a `StatefulWidget`.
- Stored study goals in a List of Maps.
- Used `ListView.builder` to display study goals dynamically.
- Added checkboxes to mark goals as completed or incomplete.
- Applied strikethrough styling to completed goals.
- Added functionality to delete study goals.
- Added a button to insert a sample study goal.
- Used `setState()` to update the user interface.
- Included `LOGIC` and `CONNECTION` comments.

### Phase 3: Statistics & Cards

- Added three statistics cards:
  - Total Study Hours
  - Completed Goals
  - Remaining Goals
- Used `fold()` to calculate total study hours.
- Used `where()` to count completed goals.
- Created a reusable `StatCard` StatelessWidget.
- Used `Row` and `Expanded` to display statistics cards equally.
- Implemented automatic statistics updates whenever study goals change.
- Added a friendly message when there are no study goals.

### Phase 4: Second Screen

- Created a separate `AddGoalScreen`.
- Added subject and study-hours input fields.
- Used `TextEditingController` to manage user input.
- Implemented input validation.
- Used `Navigator.push()` to open the second screen.
- Used `Navigator.pop()` to return the newly created goal.
- Used `dispose()` to release the controllers and manage resources properly.

### Phase 5: Database Persistence

- Integrated SQLite database support using the `sqflite` package.
- Created a separate database helper file named `database_helper.dart`.
- Created an SQLite database table named `goals`.
- Implemented the following database operations:

| Method           | Description                      |
| ---------------- | -------------------------------- |
| `initDatabase()` | Initializes the SQLite database. |
| `insertGoal()`   | Adds a new study goal.           |
| `getGoals()`     | Retrieves saved study goals.     |
| `updateGoal()`   | Updates an existing study goal.  |
| `deleteGoal()`   | Deletes a study goal.            |

- Used `async` and `await` for asynchronous database operations.
- Implemented data persistence so study goals remain available after closing and reopening the application.

##  Technologies Used

- **Flutter** – Mobile application development framework.
- **Dart** – Programming language.
- **SQLite** – Local database storage.
- **sqflite** – Flutter package for SQLite database integration.
- **Visual Studio Code** – Development environment.
- **Android Emulator / Android Device** – Application testing.

##  How to Run the Project

1. Install Flutter and Dart.

2. Clone this repository:

   ```bash
   git clone https://github.com/izabayonazer-hash/Group_7_Study_Planner.git
   ```

3. Open the project folder:

   ```bash
   cd study_planner
   ```

4. Install the dependencies:

   ```bash
   flutter pub get
   ```

5. Check connected devices:

   ```bash
   flutter devices
   ```

6. Run the application:

   ```bash
   flutter run
   ```

## Key Features

- Add new study goals.
- Track study hours.
- Mark study goals as completed or incomplete.
- Delete study goals.
- View total study hours.
- Monitor completed and remaining goals.
- Store study goals locally using SQLite.
- Keep saved study information after restarting the application.

## Conclusion

My Study Planner is a Flutter and Dart mobile application designed to help students manage their academic activities effectively. It provides an organized way to create study goals, track study hours, monitor progress, and manage completed tasks.

Through this project, Group 7 applied important Flutter and Dart programming concepts, including widgets, state management, navigation, reusable components, asynchronous programming, and SQLite database integration.

The project demonstrates how mobile application development can provide practical solutions to students' everyday academic planning needs.

---

**Developed by Group 7**
**Project:** My Study Planner
**Framework:** Flutter
**Language:** Dart
