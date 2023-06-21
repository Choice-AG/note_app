import 'package:flutter/material.dart';
import 'package:note_app/ui/configure.dart';

class ThemeController {
  ThemeController._();

  static final instance = ThemeController._();

  final ValueNotifier<bool> brightness = ValueNotifier<bool>(true);
  bool get brightnessValue => brightness.value;

  Color primary() => brightnessValue ? Configure.primary : Configure.primaryDark;
  Color secondary() => Configure.secondary;
  Color auxiliar() => Configure.auxiliar;
  Color accent() => Configure.accent;

  Color primaryButton() => brightnessValue ? Configure.primaryButtonLight : Configure.primaryButtonDark;
  Color secondaryButton() => Configure.secondaryButtonLight;

  Color background() => brightnessValue ? Configure.backgroundLight : Configure.backgroundDark;

  void changeTheme() {
    brightness.value = !brightness.value;
  }
}
