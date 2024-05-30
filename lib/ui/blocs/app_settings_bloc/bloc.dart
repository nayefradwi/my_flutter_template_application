import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_application/domain/domain.dart';
import 'package:my_flutter_template_application/ui/blocs/app_settings_bloc/state.dart';

class AppSettingsBloc extends Cubit<AppSettingsState> {
  final GetLanguageUseCase getLanguageUseCase;
  final SetLanguageUseCase setLanguageUseCase;
  AppSettingsBloc({
    required this.getLanguageUseCase,
    required this.setLanguageUseCase,
  }) : super(AppSettingsState(locale: const Locale('en')));

  void setLanguage(String languageCode) {
    setLanguageUseCase.call(param: languageCode);
    emit(state.languageChanged(Locale(languageCode)));
  }

  void setInitialLanguage(String languageCode) {
    setLanguageUseCase.call(param: languageCode);
    emit(state.copyWith(locale: Locale(languageCode)));
  }
}
