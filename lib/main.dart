
import 'package:flutter/material.dart';

void main() {
  runApp(const StudyPlannerApp());
}

class StudyPlannerApp extends StatelessWidget {
  const StudyPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Planner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class StudyTask {
  String title;
  bool isCompleted;

  StudyTask({
    required this.title,
    this.isCompleted = false,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController taskController =
      TextEditingController();

  final List<StudyTask> tasks = [
    StudyTask(title: 'Study Flutter and Dart'),
    StudyTask(title: 'Complete Java assignment'),
    StudyTask(title: 'Practice networking'),
  ];

  void addTask() {
    if (taskController.text.trim().isEmpty) return;

    setState(() {
      tasks.add(
        StudyTask(title: taskController.text.trim()),
      );
      taskController.clear();
    });

    Navigator.pop(context);
  }

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a study task'),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(
            hintText: 'Enter your task',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              taskController.clear();
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completedTasks =
        tasks.where((task) => task.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study Planner',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Student!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Plan your studies and achieve your goals.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text('Your Progress'),
                        const SizedBox(height: 8),
                        Text(
                          '$completedTasks / ${tasks.length} completed',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.school,
                      size: 45,
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Today's Study Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text('No tasks yet. Add a task!'),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        return Card(
                          child: CheckboxListTile(
                            value: task.isCompleted,
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            secondary: IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                            ),
                            onChanged: (value) {
                              setState(() {
                                task.isCompleted = value ?? false;
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddTaskDialog,
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
      ),
    );
  }
}
