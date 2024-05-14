part of 'repositories.dart';

class LocalRepository implements ILocalRepository{
  
  final LocalDataSource _dataSource;

  LocalRepository({required LocalDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<List<Task>> getTasks() async{
    final response = await _dataSource.fetchData();
    return response.map((e) => e.toEntity()).toList();
  }
  
  @override
  Future<bool> postTask({required String rawData,}) async{
    return await _dataSource.saveTask(rawData);
  }
  
  @override
  Future<bool> updateTaskStatus({required String rawData}) async{
    return await _dataSource.saveTask(rawData,);
  }

}