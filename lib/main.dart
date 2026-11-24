
import 'package:flutter/material.dart';

void main() => runApp(const StudyPlannerApp());

class StudyPlannerApp extends StatelessWidget {
  const StudyPlannerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Study Planner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF5267D8),
            surface: const Color(0xFFF7F8FC),
          ),
          scaffoldBackgroundColor: const Color(0xFFF7F8FC),
          cardTheme: CardThemeData(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(color: Color(0xFFE9EAF1)),
            ),
          ),
        ),
        home: const PlannerHomePage(),
      );
}

enum TaskFilter { all, pending, completed }

class StudyTask {
  StudyTask(this.title, {this.isCompleted = false});
  final String title;
  bool isCompleted;
}

class PlannerHomePage extends StatefulWidget {
  const PlannerHomePage({super.key});

  @override
  State<PlannerHomePage> createState() => _PlannerHomePageState();
}

class _PlannerHomePageState extends State<PlannerHomePage> {
  final List<StudyTask> _tasks = [
    StudyTask('Review Flutter widget basics'),
    StudyTask('Complete Java assignment'),
    StudyTask('Practice computer networking', isCompleted: true),
  ];
  TaskFilter _filter = TaskFilter.all;
  final TextEditingController _searchController = TextEditingController();
  bool _searchOpen = false;

  int get _completed => _tasks.where((task) => task.isCompleted).length;
  List<StudyTask> get _visibleTasks => _tasks.where((task) {
        if (!_matchesFilter(task)) return false;
        return task.title
            .toLowerCase()
            .contains(_searchController.text.trim().toLowerCase());
      }).toList();

  bool _matchesFilter(StudyTask task) {
    switch (_filter) {
      case TaskFilter.pending:
        return !task.isCompleted;
      case TaskFilter.completed:
        return task.isCompleted;
      case TaskFilter.all:
        return true;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refreshTasks() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (mounted) setState(() {});
  }

  Future<void> _showAddTaskDialog() async {
    final title = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add a study task'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            onSubmitted: (value) => Navigator.pop(context, value),
            decoration: const InputDecoration(
              hintText: 'e.g. Review biology notes',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Add task'),
            ),
          ],
        );
      },
    );
    if (!mounted || title == null || title.trim().isEmpty) return;
    setState(() {
      _tasks.insert(0, StudyTask(title.trim()));
      _filter = TaskFilter.all;
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final desktop = constraints.maxWidth >= 900;
          final content = _buildContent(desktop);
          if (!desktop) return content;
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: constraints.maxWidth >= 1100,
                  selectedIndex: 0,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: Icon(Icons.auto_stories_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 32),
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard_outlined),
                      selectedIcon: Icon(Icons.dashboard_rounded),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.checklist_rounded),
                      label: Text('My tasks'),
                    ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: content),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: _showAddTaskDialog,
              icon: const Icon(Icons.add),
              label: const Text('Add task'),
            ),
          );
        },
      );

  Widget _buildContent(bool desktop) => Scaffold(
        appBar: desktop
            ? null
            : AppBar(
                title: const Text('Study Planner'),
                actions: [
                  IconButton(
                    tooltip: 'Add task',
                    onPressed: _showAddTaskDialog,
                    icon: const Icon(Icons.add_rounded),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
        body: SafeArea(
          top: desktop,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: desktop ? 40 : 20,
                  vertical: desktop ? 32 : 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      desktop ? 'Your study dashboard' : 'Hello, Student! 👋',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Make a little progress every day.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 24),
                    _buildFilters(),
                    const SizedBox(height: 16),
                    _buildSummary(),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: Text('Your tasks',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ),
                        IconButton(
                          tooltip: _searchOpen ? 'Close search' : 'Search tasks',
                          onPressed: () => setState(() {
                            _searchOpen = !_searchOpen;
                            if (!_searchOpen) _searchController.clear();
                          }),
                          icon: Icon(_searchOpen ? Icons.close : Icons.search),
                        ),
                        if (desktop)
                          FilledButton.icon(
                            onPressed: _showAddTaskDialog,
                            icon: const Icon(Icons.add),
                            label: const Text('New task'),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_searchOpen) ...[
                      TextField(
                        controller: _searchController,
                        autofocus: true,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Search your tasks',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            tooltip: 'Clear search',
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    Expanded(child: _buildTaskList()),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: desktop
            ? null
            : FloatingActionButton.extended(
                onPressed: _showAddTaskDialog,
                icon: const Icon(Icons.add),
                label: const Text('Add task'),
              ),
      );

  Widget _buildSummary() {
    final pending = _tasks.length - _completed;
    final cards = [
      _StatCard(
        label: 'Total tasks',
        value: '${_tasks.length}',
        icon: Icons.menu_book_rounded,
        color: const Color(0xFF5267D8),
      ),
      _StatCard(
        label: 'Completed',
        value: '$_completed',
        icon: Icons.task_alt_rounded,
        color: const Color(0xFF21966B),
      ),
      _StatCard(
        label: 'To do',
        value: '$pending',
        icon: Icons.schedule_rounded,
        color: const Color(0xFFE69737),
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 560) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < cards.length; i++) ...[
                  SizedBox(width: 190, child: cards[i]),
                  if (i != cards.length - 1) const SizedBox(width: 10),
                ],
              ],
            ),
          );
        }
        return Row(
          children: [
            for (var i = 0; i < cards.length; i++) ...[
              Expanded(child: cards[i]),
              if (i != cards.length - 1) const SizedBox(width: 14),
            ],
          ],
        );
      },
    );
  }

  Widget _buildFilters() => Wrap(
        spacing: 8,
        children: [
          for (final filter in TaskFilter.values)
            ChoiceChip(
              label: Text(switch (filter) {
                TaskFilter.all => 'All (${_tasks.length})',
                TaskFilter.pending => 'To do (${_tasks.length - _completed})',
                TaskFilter.completed => 'Completed ($_completed)',
              }),
              selected: _filter == filter,
              onSelected: (_) => setState(() => _filter = filter),
            ),
        ],
      );

  Widget _buildTaskList() {
    final visible = _visibleTasks;
    if (visible.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.event_note_rounded,
                size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(
                _tasks.isEmpty
                    ? 'No tasks yet'
                    : _searchController.text.trim().isNotEmpty
                        ? 'No matching tasks'
                        : 'Nothing in this filter',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(_tasks.isEmpty
                ? 'Add a task to get your study plan started.'
                : _searchController.text.trim().isNotEmpty
                    ? 'Try another search term.'
                    : 'Try a different task filter.'),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _refreshTasks,
      displacement: 28,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 90, top: 4),
        itemCount: visible.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final task = visible[index];
          return Card(
            child: CheckboxListTile(
              value: task.isCompleted,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                task.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  color: task.isCompleted ? Colors.black45 : null,
                ),
              ),
              subtitle: Text(task.isCompleted ? 'Completed' : 'Study goal'),
              secondary: IconButton(
                tooltip: 'Delete task',
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: () => setState(() => _tasks.remove(task)),
              ),
              onChanged: (value) => setState(() => task.isCompleted = value ?? false),
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: color.withValues(alpha: 0.12),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: const TextStyle(color: Colors.black54)),
                    const SizedBox(height: 4),
                    Text(value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
