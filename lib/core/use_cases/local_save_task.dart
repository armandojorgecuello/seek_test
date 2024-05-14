part of 'use_cases.dart';

class PostLocalTasksUseCase {
  final LocalRepository _repository;

  PostLocalTasksUseCase(this._repository);

  Future<bool> postTask({required String rawData,})async{
    return await _repository.postTask(rawData: rawData,);
  }
}