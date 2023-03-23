part of 'theme_switcher_cubit.dart';

@immutable
class ThemeSwitcherState extends Equatable {
  final MyAppThemes appTheme;

  const ThemeSwitcherState({
    required this.appTheme,
  });

  @override
  List<Object?> get props => [
        appTheme,
      ];
}
