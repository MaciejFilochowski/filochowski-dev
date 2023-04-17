part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final ThemeMode themeMode;

  const ThemeState({required this.theme, required this.themeMode});

  @override
  List<Object> get props => [theme, themeMode];
}
