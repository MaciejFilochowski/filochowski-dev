import 'dart:ui' as ui;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

const String langKey = "langCode";

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static Locale initLocale = ui.window.locale;

  LanguageBloc() : super(LanguageState(locale: initLocale)) {
    on<LoadLanguage>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? langCode = prefs.getString(langKey);
      debugPrint(langCode);
      if (langCode != null) {
        initLocale = Locale(langCode);
      }

      emit(LanguageState(locale: initLocale));
    });
    on<ChangeLanguage>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(langKey, event.locale.languageCode);

      emit(LanguageState(locale: event.locale));
    });
  }
}
