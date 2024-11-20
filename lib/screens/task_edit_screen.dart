import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskEditScreen extends StatefulWidget {
  final Task task;

  TaskEditScreen({required this.task});

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController datetimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.task.name;
    datetimeController.text = DateTime.fromMillisecondsSinceEpoch(widget.task.endTime).toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: datetimeController,
              decoration: InputDecoration(labelText: 'Due Time'),
              keyboardType: TextInputType.datetime,
            ),
            ElevatedButton(
              onPressed: () {
                // Save changes to the task
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
