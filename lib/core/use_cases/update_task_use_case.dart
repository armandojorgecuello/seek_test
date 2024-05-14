part of 'use_cases.dart';

class UpdateTasksUseCase {
  final AppRepository _repository;

  UpdateTasksUseCase(this._repository);

  Future<bool> updateTaskStatus(String userId, String taskId, String status) async{
    return await _repository.updateTaskStatus(userId, taskId, status);
  }
}