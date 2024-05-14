part of 'home.dart';

class HomeState {
  final bool isLoading;
  final bool isUpdating;
  final List<Task> allTasks;
  final List<Task>? tasksFiltered;
  final String typeSelected;
  HomeState({
    required this.isLoading,
    required this.allTasks,
    this.tasksFiltered,
    required this.isUpdating,
    required this.typeSelected,
  });

  List<Task> get tasks => tasksFiltered != null ? tasksFiltered! : allTasks;

  factory HomeState.initial() => HomeState(
        isLoading: true,
        isUpdating: false,
        allTasks: <Task>[],
        tasksFiltered: null,
        typeSelected: 'Todas',
      );

  HomeState copyWith({
    bool? isLoading,
    bool? isUpdating,
    List<Task>? allTasks,
    List<Task>? tasksFiltered,
    String? typeSelected,
  }) =>
      HomeState(
        isLoading: isLoading ?? this.isLoading,
        isUpdating: isUpdating ?? this.isUpdating,
        allTasks: allTasks ?? this.allTasks,
        tasksFiltered: tasksFiltered ?? this.tasksFiltered,
        typeSelected: typeSelected ?? this.typeSelected,
      );
}
