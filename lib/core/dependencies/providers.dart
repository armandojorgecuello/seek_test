part of 'dependencies.dart';

Provider<FirebaseService> firebaseInstanceProvider = Provider<FirebaseService>(
  (ref) => FirebaseService(),
);

Provider<InternetConnectionService> internetValidatorProvider = Provider<InternetConnectionService>(
  (ref) => InternetConnectionService(),
);

Provider<AppDataSource> appDataSourceProvider = Provider<AppDataSource>(
  (ref) => AppDataSource(
    ref.watch(firebaseInstanceProvider),
  ),
);

Provider<AppRepository> appRepositoryProvider = Provider<AppRepository>(
  (ref) => AppRepository(
    dataSource: ref.watch(
      appDataSourceProvider,
    ),
  ),
);

Provider<GetTasksUseCase> getTasksUseCaseProvider = Provider<GetTasksUseCase>(
  (ref) => GetTasksUseCase(
    ref.watch(appRepositoryProvider),
  ),
);

Provider<PostTasksUseCase> postTasksUseCaseProvider =
    Provider<PostTasksUseCase>(
  (ref) => PostTasksUseCase(
    ref.watch(appRepositoryProvider),
  ),
);

Provider<UpdateTasksUseCase> updateTasksUseCaseProvider =
    Provider<UpdateTasksUseCase>(
  (ref) => UpdateTasksUseCase(
    ref.watch(appRepositoryProvider),
  ),
);

final Provider<Database> databaseProvider =
    Provider<Database>((ProviderRef<Database> ref) {
  final Database database = Database();

  ref.onDispose(database.close);
  return database;
});

Provider<LocalDataSource> localDataSourceProvider = Provider<LocalDataSource>(
  (ref) => LocalDataSource(
    localDB: ref.watch(databaseProvider),
  ),
);

Provider<LocalRepository> localRepositoryProvider = Provider<LocalRepository>(
  (ref) => LocalRepository(
    dataSource: ref.watch(
      localDataSourceProvider,
    ),
  ),
);

Provider<LocalGetTasksUseCase> getLocalTasksUseCaseProvider =
    Provider<LocalGetTasksUseCase>(
  (ref) => LocalGetTasksUseCase(
    ref.watch(localRepositoryProvider),
  ),
);

Provider<PostLocalTasksUseCase> postLocalTasksUseCaseProvider =
    Provider<PostLocalTasksUseCase>(
  (ref) => PostLocalTasksUseCase(
    ref.watch(localRepositoryProvider),
  ),
);

Provider<UpdateLocalTasksUseCase> updateLocalTasksUseCaseProvider =
    Provider<UpdateLocalTasksUseCase>(
  (ref) => UpdateLocalTasksUseCase(
    ref.watch(localRepositoryProvider),
  ),
);
