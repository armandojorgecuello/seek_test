part of 'repositories.dart';

class AppRepository implements IAppRepository{
  
  final AppDataSource _dataSource;

  AppRepository({required AppDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<List<Task>> getTasks(String path,) async{
    final response = await _dataSource.getTasks(path);
    return response.map((e) => e.toEntity()).toList();
  }
  
  @override
  Future<bool> postTask({required String path, required taskDTO}) async{
    return await _dataSource.postTask(path: path,taskDTO: taskDTO,);
  }
  
  @override
  Future<bool> updateTaskStatus(String userId, String taskId, String status) async{
    return await _dataSource.updateTaskStatus(userId, taskId, status);
  }

}