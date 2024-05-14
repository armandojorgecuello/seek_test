import 'package:hive_flutter/hive_flutter.dart';

part 'task_dto.g.dart';

@HiveType(typeId: 1)
class TaskDTODB extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String priority;
  @HiveField(4)
  final String duration;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String taskId;

  TaskDTODB({
    required this.name,
    required this.taskId,
    required this.date,
    required this.status,
    required this.priority,
    required this.duration,
    required this.description,
  });

  TaskDTODB copyWith({
    String? name,
    String? date,
    String? taskId,
    String? status,
    String? priority,
    String? duration,
    String? description,
  }) =>
      TaskDTODB(
        name: name ?? this.name,
        taskId: taskId ?? this.taskId,
        date: date ?? this.date,
        status: status ?? this.status,
        priority: priority ?? this.priority,
        duration: duration ?? this.duration,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() => {
        'task_id':taskId,
        'title': name,
        'creation_date': date,
        'status': status,
        'priority': priority,
        'duration': duration,
        'description':description,
      };
}
