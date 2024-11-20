class Task {
  final int id;
  String name;
  int duration;
  int endTime;
  int startTime;

  Task({
    required this.id,
    required this.name,
    required this.duration,
    required this.endTime,
    required this.startTime,
  });

  // Convert Task to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'endTime': endTime,
      'startTime': startTime,
    };
  }

  // Convert JSON to Task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      endTime: json['endTime'],
      startTime: json['startTime'],
    );
  }
}