part of 'models.dart';

class TaskModel {
  final String taskId;
  final String title;
  final String creationDate;
  final String description;
  final String status;
  final String priority;
  final String duration;

  TaskModel({
    required this.taskId,
    required this.title,
    required this.creationDate,
    required this.description,
    required this.status,
    required this.priority,
    required this.duration,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String taskId) =>
      TaskModel(
        taskId: taskId,
        title: json['title'],
        creationDate: json['creation_date'],
        description: json['status'],
        status: json['status'],
        priority: json['priority'],
        duration: json['duration'],
      );

  Task toEntity() => Task(
        taskId: taskId,
        title: title,
        creationDate: creationDate,
        description: description,
        status: status,
        priority: priority,
        duration: duration,
      );
}
