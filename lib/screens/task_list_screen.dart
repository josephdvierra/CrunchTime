import 'package:flutter/material.dart';
import 'task_item.dart';
import '../models/task.dart';
import '../storage.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];
  String sortOption = 'time-asc';

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // Load tasks from local storage
  _loadTasks() async {
    tasks = await Storage.loadTasks();
    _sortTasks();
  }

  // Sort tasks based on selected option
  _sortTasks() {
    switch (sortOption) {
      case 'time-asc':
        tasks.sort((a, b) => a.endTime.compareTo(b.endTime));
        break;
      case 'time-desc':
        tasks.sort((a, b) => b.endTime.compareTo(a.endTime));
        break;
      case 'alpha-asc':
        tasks.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'alpha-desc':
        tasks.sort((a, b) => b.name.compareTo(a.name));
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: sortOption,
            onChanged: (value) {
              setState(() {
                sortOption = value!;
                _sortTasks();
              });
            },
            items: [
              DropdownMenuItem(value: 'time-asc', child: Text('Due Time: Earliest First')),
              DropdownMenuItem(value: 'time-desc', child: Text('Due Time: Latest First')),
              DropdownMenuItem(value: 'alpha-asc', child: Text('Alphabetically: A-Z')),
              DropdownMenuItem(value: 'alpha-desc', child: Text('Alphabetically: Z-A')),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
