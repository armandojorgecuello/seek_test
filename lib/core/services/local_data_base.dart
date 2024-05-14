part of 'services.dart';
class Database {
  Future<void> initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserStorageDBAdapter());
    Hive.registerAdapter(TaskDTODBAdapter());
  }

  Future<void> close() => Hive.close();

  LocalStorageHandler<UserStorageDB> user() =>
      LocalStorageHandler<UserStorageDB>(name: 'user');

  LocalStorageHandler<String?> tasks() =>
      LocalStorageHandler<String?>(name: 'tasks');
}
