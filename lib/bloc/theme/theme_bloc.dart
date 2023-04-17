import 'package:equatable/equatable.dart';
import 'package:filochowski_dev/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

const String themeKey = "theme";

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static ThemeData initTheme = CustomTheme.darkTheme;
  static ThemeMode initThemeMode = ThemeMode.dark;

  ThemeBloc() : super(ThemeState(theme: initTheme, themeMode: initThemeMode)) {
    on<LoadTheme>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? theme = prefs.getString(themeKey);
      if (theme == ThemeMode.light.name) {
        initTheme = CustomTheme.lightTheme;
        initThemeMode = ThemeMode.light;
      }

      emit(ThemeState(theme: initTheme, themeMode: initThemeMode));
    });

    on<ChangeTheme>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(themeKey, event.themeMode.name);

      emit(ThemeState(theme: event.theme, themeMode: event.themeMode));
    });
  }
}
