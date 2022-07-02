import 'dart:convert';

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;
  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
