part of 'data_source.dart';

class LocalDataSource {
  final Database _localDB;

  LocalDataSource({required Database localDB}) : _localDB = localDB;

  Future<bool> saveUser(String uuid) async {
    UserStorageDB user = UserStorageDB(uuid: uuid);
    return await _localDB.user().set(user);
  }

  Future<bool> saveTask(String rawData) async {
    return await _localDB.tasks().set(rawData);
  }

  Future<List<TaskModel>> fetchData() async {
    final String? rawData = await _localDB.tasks().get();
    List<TaskModel> data = <TaskModel>[];
    if (rawData != null) {
      List<dynamic> decodedData = json.decode(rawData);
      for (var i = 0; i < decodedData.length; i++) {
        TaskModel task = TaskModel(
          taskId: decodedData[i].taskId,
          title: decodedData[i].title,
          creationDate: decodedData[i].creationDate,
          description: decodedData[i].description,
          status: decodedData[i].status,
          priority: decodedData[i].priority,
          duration: decodedData[i].duration,
        );
        data.insert(i, task);
      }
    }
    return data;
  }

  Future<String> getUserId() async {
    final response = await _localDB.user().get();
    return response!.uuid;
  }
}
