part of 'use_cases.dart';

class UpdateLocalTasksUseCase {
  final LocalRepository _repository;

  UpdateLocalTasksUseCase(this._repository);

  Future<bool> updateTaskStatus(String rawData,) async{
    return await _repository.updateTaskStatus(rawData: rawData);
  }
}