import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  double _value = 10;
  double get value => _value;

  void setValue(val) {
    _value = val;
    notifyListeners();
  }
}
