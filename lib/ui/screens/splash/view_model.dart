part of 'splash.dart';

class SplashViewModel extends StateNotifier<SplashState> {
  final StateNotifierProviderRef<SplashViewModel, SplashState> ref;
  SplashViewModel(this.ref) : super(SplashState.initial());

  Future<void> initConfig(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await ref.read(databaseProvider).initDB();
      await ref.read(databaseProvider).user().get().then((response) async {
        if (response != null) {
          Navigator.pushNamed(
            context,
            Routes.kHomeScreen,
            arguments: {'uuid': response.uuid},
          );
        } else {
          var uuid = const Uuid();
          UserStorageDB userIdentifier = UserStorageDB(
            uuid: uuid.v4(),
          );
          await ref.read(databaseProvider).user().set(userIdentifier).then(
                (value) => Navigator.pushNamed(
                  context,
                  Routes.kHomeScreen,
                  arguments: {'uuid': uuid.v4()},
                ),
              );
        }
      });
    });
  }
}
