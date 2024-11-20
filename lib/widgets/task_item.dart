import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  String formatTime(int milliseconds) {
    var duration = Duration(milliseconds: milliseconds);
    return '${duration.inDays}d ${duration.inHours % 24}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s';
  }

  @override
  Widget build(BuildContext context) {
    int timeRemaining = task.endTime - DateTime.now().millisecondsSinceEpoch;
    String timerText = timeRemaining < 0
        ? 'Overdue by: ${formatTime(-timeRemaining)}'
        : formatTime(timeRemaining);

    return ListTile(
      title: Text(task.name),
      subtitle: Text(timerText),
      onTap: () {
        // Navigate to task details
      },
    );
  }
}
