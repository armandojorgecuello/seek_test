part of 'repositories.dart';

abstract class ILocalRepository {
  Future<List<Task>> getTasks();
  Future<bool> postTask({
    required String rawData,
  });
  Future<bool> updateTaskStatus({
    required String rawData,
  });
}
