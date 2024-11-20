import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'models/task.dart';

class Storage {
  // Save tasks to SharedPreferences
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> tasksJson = tasks.map((task) => jsonEncode(task.toJson())).toList();
    prefs.setStringList('tasks', tasksJson);
  }

  // Load tasks from SharedPreferences
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? tasksJson = prefs.getStringList('tasks');
    if (tasksJson == null) {
      return [];
    }
    return tasksJson.map((task) => Task.fromJson(jsonDecode(task))).toList();
  }
}
