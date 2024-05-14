part of 'use_cases.dart';

class GetTasksUseCase {
  final AppRepository _repository;

  GetTasksUseCase(this._repository);

  Future<List<Task>> execute(String path) {
    return _repository.getTasks(path);
  }
}
