part of 'new_task.dart';

class NewTaskViewModel extends StateNotifier<NewTaskState> {
  final StateNotifierProviderRef<NewTaskViewModel, NewTaskState> ref;
  NewTaskViewModel(this.ref) : super(NewTaskState.initial());

  Future<void> createNewTask(
    GlobalKey<FormState> form,
    TaskDTODB taskDTO,
    String uuid,
    BuildContext context,
  ) async {
    updateStatus('Nueva');
    if (form.currentState!.validate()) {
      state = state.copyWith(isLoading: true);
      postTask(path: uuid, taskDTO: taskDTO, context: context);
    }
  }

  void updateTitle(String title) {
    state = state.copyWith(
      taskDTO: state.taskDTO.copyWith(
        name: title,
      ),
    );
  }

  void updateDate(
    String date,
  ) {
    state = state.copyWith(
      taskDTO: state.taskDTO.copyWith(
        date: date,
      ),
    );
  }

  void updateDateFormatted(
    String dateFormmated,
  ) {
    state = state.copyWith(
      date: dateFormmated,
    );
  }

  Future<String?> selectCreationDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      return picked.toIso8601String();
    } else {
      return null;
    }
  }

  void updateDescription(String description) {
    state = state.copyWith(
      taskDTO: state.taskDTO.copyWith(
        description: description,
      ),
    );
  }

  void updateDuration(String duration) {
    state = state.copyWith(
      taskDTO: state.taskDTO.copyWith(
        duration: duration,
      ),
    );
  }

  void updatePriority(String priority) {
    state = state.copyWith(
      taskDTO: state.taskDTO.copyWith(
        priority: priority,
      ),
    );
  }

  void updateStatus(String status) {
    state = state.copyWith(
      taskDTO: state.taskDTO.copyWith(
        status: status,
      ),
    );
  }

  Future<void> postTask(
      {required String path,
      required TaskDTODB taskDTO,
      required BuildContext context}) async {
    ref
        .read(postTasksUseCaseProvider)
        .postTask(path: path, taskDTO: taskDTO)
        .then((data) async {
      if (data) {
        saveTasksInLocal(
          taskDTO,
        );
        state = state.copyWith(isLoading: false);
        successModal(
          context,
          'Felicidades',
          'Tu tarea se ha creado con éxito',
          path,
        );
      }
    });
  }

  void successModal(
      BuildContext context, String title, String description, String uuid) {
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return CustomDialog(
          title: title,
          acceptButton: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              Routes.kHomeScreen,
              arguments: {
                'uuid': uuid,
              },
            );
          },
          subtitle: description,
        );
      },
    );
  }

  saveTasksInLocal(TaskDTODB task) {
    ref.read(getLocalTasksUseCaseProvider).execute().then((value) {
      if (value.isNotEmpty) {
        List<Map<String, dynamic>> objectMap = value
            .map((e) => TaskDTODB(
                  name: e.title,
                  taskId: e.taskId,
                  date: e.creationDate,
                  status: e.status,
                  priority: e.priority,
                  duration: e.duration,
                  description: e.description,
                ).toJson())
            .toList();
        final newtask = TaskDTODB(
          name: task.name,
          taskId: task.taskId,
          date: task.date,
          status: task.status,
          priority: task.priority,
          duration: task.duration,
          description: task.description,
        ).toJson();
        objectMap.insert(objectMap.length - 1, newtask);
        String rawData = json.encode(objectMap);
        ref.read(postLocalTasksUseCaseProvider).postTask(rawData: rawData);
      }
    });
  }
}
