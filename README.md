My Study Planner — Flutter & Dart Final Project
Group number : 7

Group reg.Numbers:

26495/2024
27087/2024
27130/2024
26455/2024
Project Description
My Study Planner is a Flutter mobile application that helps students organize their study goals, track study hours, and monitor their progress.

Phase 1: Static Screen
Created a Flutter project named study_planner.
Used MaterialApp, Scaffold, and StatelessWidget.
Added an AppBar with the title "My Study Planner".
Created at least three study goal cards using Card and ListTile.
Added a heading and Floating Action Button.
Added STATIC comments above major widget sections.
Phase 2: Working List
Converted the main screen into a StatefulWidget.
Stored study goals in a List of Maps.
Used ListView.builder to display study goals dynamically.
Added checkboxes to mark goals as completed or incomplete.
Used strikethrough styling for completed goals.
Added delete functionality to remove goals.
Added a button to insert a sample study goal.
Used setState() to update the interface.
Added LOGIC and CONNECTION comments.
Phase 3: Statistics & Cards
Added three statistics cards: Total Hours, Completed Goals, and Remaining Goals.
Used fold() to calculate total study hours.
Used where() to count completed goals.
Created a reusable StatCard StatelessWidget.
Used Row and Expanded to display the cards equally.
Statistics update automatically when goals change.
Added a friendly message when there are no study goals.
Phase 4: Second Screen
Created a separate AddGoalScreen.
Added subject and study-hours input fields.
Used TextEditingController to manage user input.
Added input validation.
Used Navigator.push() to open the second screen.
Used Navigator.pop() to return the new goal.
Used dispose() to release the controllers.
Phase 5: Database Persistence
Added SQLite database support using sqflite.
Created database_helper.dart.
Created a database table named goals.
Implemented database operations:
initDatabase()
insertGoal()
getGoals()
updateGoal()
deleteGoal()
Used async and await for database operations.
Saved study goals so they remain available after closing and reopening the application.
Technologies Used
Flutter
Dart
Visual Studio Code
Android Emulator
Conclusion
My Study Planner helps students manage their study activities by allowing them to add, complete, delete, and track study goals. It also calculates study statistics and stores information in a datab
