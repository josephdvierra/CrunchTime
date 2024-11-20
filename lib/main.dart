import 'package:flutter/material.dart';
import 'screens/task_list_screen.dart';
import 'screens/task_detail_screen.dart';
import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListScreen(),
      routes: {
        '/task-detail': (context) => TaskDetailScreen(task: ModalRoute.of(context)!.settings.arguments as Task),
      },
    );
  }
}
