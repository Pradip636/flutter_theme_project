import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/util/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_theme_state.dart';

class MyThemeCubit extends Cubit<MyThemeState> {
  static final _lightTheme = MyTheme.light;
  static final _darkTheme = MyTheme.dark;

  MyThemeCubit() : super(MyThemeState(theme: _lightTheme));

  void toggleTheme(bool isDark) {
    final theme = isDark ? _darkTheme : _lightTheme;
    emit(MyThemeState(theme: theme));
    _saveTheme(isDark);
  }

  Future<void> _saveTheme(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("isDark", isDark);
  }

  Future<bool> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("isDark") ?? false;
  }

  Future<void> initialTheme() async {
    final isDark = await loadTheme();
    final theme = isDark ? _darkTheme : _lightTheme;
    emit(MyThemeState(theme: theme));
  }
}
