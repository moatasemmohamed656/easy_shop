import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_store/core/services/shared_pref/pref_keys.dart';
import 'package:app_store/core/services/shared_pref/shared_pref.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;
  String currentLangCode = "en";

  // theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark);
     
      print('[DEBUG] Saved theme to SharedPref: isDark = $isDark');
      emit(AppState.themeChangeMode(isDark: isDark));
    }
  }

  //Language Change
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';

    currentLangCode = result!;
    print('[DEBUG] Loaded language from SharedPref: $currentLangCode');

    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang('ar');

  void toEnglish() => _changeLang('en');
}
