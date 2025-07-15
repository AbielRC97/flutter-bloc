import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(isDarkMode: darkMode));
  void toggle() => emit(ThemeState(isDarkMode: !state.isDarkMode));
  void darkMode() => emit(const ThemeState(isDarkMode: true));
  void lightMode() => emit(const ThemeState(isDarkMode: false));
}
