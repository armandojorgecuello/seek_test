part of 'new_task.dart';

class NewTaskState {
  final bool isLoading;
  final TaskDTODB taskDTO;
  final String? date;
  NewTaskState({
    required this.isLoading,
    required this.taskDTO,
    this.date,
  });

  factory NewTaskState.initial() => NewTaskState(
        isLoading: false,
        date: null,
        taskDTO: TaskDTODB(
          name: '',
          date: '',
          status: '',
          priority: '',
          duration: '',
          description: '',
          taskId: '',
        ),
      );

  NewTaskState copyWith({
    bool? isLoading,
    String? date,
    TaskDTODB? taskDTO,
  }) =>
      NewTaskState(
        isLoading: isLoading ?? this.isLoading,
        date: date ?? this.date,
        taskDTO: taskDTO ?? this.taskDTO,
      );
}
