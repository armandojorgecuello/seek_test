part of 'home.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;
  HomeViewModel(this.ref) : super(HomeState.initial());

  Future<void> fetchTasks(String uuid) async {
    if (await ref.read(internetValidatorProvider).fetchInternet()) {
      final data = await ref.read(getTasksUseCaseProvider).execute(uuid);
      if (data.isNotEmpty) {
        state = state.copyWith(allTasks: data, isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } else {
      final data = await ref.read(getLocalTasksUseCaseProvider).execute();
      if (data.isNotEmpty) {
        state = state.copyWith(allTasks: data, isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
      }
    }
  }

  void navigateToCreateNewTask(
    BuildContext context,
    String uuid,
  ) {
    Navigator.pushNamed(context, Routes.kNewTaskScreen,
        arguments: {'uuid': uuid});
  }

  void selectNewTaskStatus(
    String taskId,
    BuildContext context,
    String uuid,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return TaskStatusSelector(
          selected: (value) {
            Navigator.pop(context);
            updateTask(value, taskId, uuid, context);
          },
        );
      },
    );
  }

  Future<void> updateTask(String statusSelected, String taskId, String userId,
      BuildContext context) async {
    state = state.copyWith(
      isUpdating: true,
    );
    ref
        .read(updateTasksUseCaseProvider)
        .updateTaskStatus(userId, taskId, statusSelected)
        .then((value) {
      if (value) {
        List<Task> tasks = state.allTasks;
        int index = tasks.indexWhere((element) => element.taskId == taskId);
        tasks[index] = tasks[index].copyWith(
          status: statusSelected,
        );
        state = state.copyWith(
          allTasks: tasks,
          isUpdating: false,
        );
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return CustomDialog(
              title: 'Felicidades',
              subtitle: 'Tu tarea se ha actualizado con éxito',
              acceptButton: () {
                Navigator.pop(context);
              },
            );
          },
        );
      } else {
        state = state.copyWith(
          isUpdating: true,
        );
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return CustomDialog(
              title: 'Lo sentimos',
              subtitle:
                  'Ha ocurrido une error al intentar actualizar tu tarea, por favor intentalo más tarde.',
              acceptButton: () {
                Navigator.pop(context);
              },
            );
          },
        );
      }
    });
  }

  void select(String value) {
    state = state.copyWith(
      typeSelected: value,
      isLoading: true,
    );
    List<Task> tasks = state.allTasks;
    if (value == 'Todas') {
      state = state.copyWith(
        tasksFiltered: tasks,
        isLoading: false,
      );
      return;
    }
    List<Task> tasksFiltered =
        tasks.where((element) => element.status == value).toList();
    state = state.copyWith(
      tasksFiltered: tasksFiltered,
      isLoading: false,
    );
  }
}
