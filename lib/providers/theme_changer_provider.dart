import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  void setTheme(theme) {
    _themeMode = theme;
    notifyListeners();
  }
}

class SliderProvider with ChangeNotifier {
  double _value = 10;
  double get value => _value;

  void setValue(val) {
    _value = val;
    notifyListeners();
  }
}
