part of 'use_cases.dart';

class PostTasksUseCase {
  final AppRepository _repository;

  PostTasksUseCase(this._repository);

  Future<bool> postTask({required String path, required TaskDTODB taskDTO, })async{
    return await _repository.postTask(path:path, taskDTO: taskDTO);
  }
}