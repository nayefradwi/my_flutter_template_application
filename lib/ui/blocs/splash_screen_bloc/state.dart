class SplashScreenState {
  ForceUpdateState forceUpdate() => ForceUpdateState();
  GoToHomeState goToHome() => GoToHomeState();
  LanguageInitializedState initializedState(String languageCode) =>
      LanguageInitializedState(languageCode);

  bool get isInitial => this is! ForceUpdateState && this is! GoToHomeState;
  bool get isForceUpdate => this is ForceUpdateState;
  bool get isGoToHome => this is GoToHomeState;
}

class ForceUpdateState extends SplashScreenState {}

class GoToHomeState extends SplashScreenState {}

class LanguageInitializedState extends SplashScreenState {
  final String languageCode;
  LanguageInitializedState(this.languageCode);
}
