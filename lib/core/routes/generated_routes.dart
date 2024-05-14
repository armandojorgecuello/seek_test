part of 'routes.dart';

class RouteGenerator {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kSplash:
        return SplashScreen.goTo();
      case Routes.kHomeScreen:
        final Map<String, dynamic> params =
            settings.arguments as Map<String, dynamic>;
        return TasksHomeScreen.goTo(uuid: params['uuid']);
      case Routes.kNewTaskScreen:
        final Map<String, dynamic> params =
            settings.arguments as Map<String, dynamic>;
        return NewTaskScreen.goTo(uuid: params['uuid']);
    }
    return null;
  }
}
