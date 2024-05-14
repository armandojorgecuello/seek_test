part of 'entities.dart';

class Task {
  final String taskId;
  final String title;
  final String creationDate;
  final String description;
  final String status;
  final String priority;
  final String duration;

  Task({
    required this.taskId,
    required this.title,
    required this.creationDate,
    required this.description,
    required this.status,
    required this.priority,
    required this.duration,
  });

  Task copyWith({
    String? taskId,
    String? title,
    String? creationDate,
    String? description,
    String? status,
    String? priority,
    String? duration,
  })
    =>Task(
      taskId:taskId ?? this.taskId,
      title:title ?? this.title,
      creationDate:creationDate ?? this.creationDate,
      description:description ?? this.description,
      status:status ?? this.status,
      priority:priority ?? this.priority,
      duration:duration ?? this.duration,
    );

}
