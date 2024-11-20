import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Due Time: ${DateTime.fromMillisecondsSinceEpoch(task.endTime)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Complete task logic here
              },
              child: Text('Complete Task'),
            ),
            ElevatedButton(
              onPressed: () {
                // Edit task logic here
              },
              child: Text('Edit Task'),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete task logic here
              },
              child: Text('Delete Task'),
            ),
          ],
        ),
      ),
    );
  }
}
