part of 'new_task.dart';

final StateNotifierProvider<NewTaskViewModel, NewTaskState> homeProvider =
    StateNotifierProvider<NewTaskViewModel, NewTaskState>(
  NewTaskViewModel.new,
);
