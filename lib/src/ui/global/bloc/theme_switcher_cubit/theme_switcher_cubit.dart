import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'theme_switcher_state.dart';

class ThemeSwitcherCubit extends Cubit<ThemeSwitcherState> {
  ThemeSwitcherCubit()
      : super(const ThemeSwitcherState(appTheme: MyAppThemes.light));

  void switchToLight() {
    emit(const ThemeSwitcherState(appTheme: MyAppThemes.light));
  }

  void switchToDark() {
    emit(const ThemeSwitcherState(appTheme: MyAppThemes.dark));
  }
}

enum MyAppThemes {
  light,
  dark,
}
