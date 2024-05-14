part of 'splash.dart';

final StateNotifierProvider<SplashViewModel, SplashState>
    searchPropertyProvider =
    StateNotifierProvider<SplashViewModel, SplashState>(
  SplashViewModel.new,
);
