part of 'splash.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static Route<void> goTo() => MaterialPageRoute<void>(
        builder: (_) => const SplashScreen(),
      );

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      ref.read(searchPropertyProvider.notifier).initConfig(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/lottie/splash_animation.json'),
          Text(
            'Bienvenido a tu App de tareas',
            style: TypeTitle.l,
          ),
        ],
      ),
    );
  }
}
