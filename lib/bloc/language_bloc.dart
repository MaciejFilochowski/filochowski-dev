import 'dart:ui' as ui;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static Locale initLocale = ui.window.locale;

  LanguageBloc() : super(LanguageState(locale: initLocale)) {
    on<LoadLanguage>((event, emit) async {
      emit(LanguageState(locale: initLocale));
    });
    on<ChangeLanguage>((event, emit) async {
      emit(
        LanguageState(locale: event.locale),
      );
    });
  }
}
