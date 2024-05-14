part of 'use_cases.dart';

class LocalGetTasksUseCase {
  final LocalRepository _repository;

  LocalGetTasksUseCase(this._repository);

  Future<List<Task>> execute() {
    return _repository.getTasks();
  }
}
