part of 'data_source.dart';

class AppDataSource {
  final FirebaseService _firebaseService;

  AppDataSource(this._firebaseService);

  Future<List<TaskModel>> getTasks(String path) async {
    final response = await _firebaseService.firestore
        .collection('tasks')
        .doc(path)
        .collection('user_tasks')
        .get();
    List<TaskModel> tasks = <TaskModel>[];
    if (response.docs.isNotEmpty) {
      for (var i = 0; i < response.docs.length; i++) {
        TaskModel task =
            TaskModel.fromJson(response.docs[i].data(), response.docs[i].id);
        tasks.add(task);
      }
    }
    return tasks;
  }

  Future<bool> postTask({
    required String path,
    required TaskDTODB taskDTO,
  }) async {
    try {
      CollectionReference tasksCollection = FirebaseFirestore.instance
          .collection('tasks')
          .doc(path)
          .collection('user_tasks');
      WriteBatch batch = FirebaseFirestore.instance.batch();
      DocumentReference docRef = tasksCollection.doc();
      batch.set(docRef, taskDTO.toJson());
      await batch.commit();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateTaskStatus(
      String userId, String taskId, String status) async {
    try {
      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(userId)
          .collection('user_tasks')
          .doc(taskId)
          .update({'status': status});
      return true;
    } catch (e) {
      return false;
    }
  }
}
