part of 'repositories.dart';

abstract class IAppRepository{
  Future<List<Task>> getTasks(String path);
  Future<bool> postTask({required String path, required TaskDTODB taskDTO, });
  Future<bool> updateTaskStatus(String userId, String taskId, String status);
}