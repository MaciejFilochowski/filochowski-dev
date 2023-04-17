part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class LoadTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final ThemeData theme;
  final ThemeMode themeMode;

  const ChangeTheme(this.theme, this.themeMode);

  @override
  List<Object> get props => [theme, themeMode];
}
