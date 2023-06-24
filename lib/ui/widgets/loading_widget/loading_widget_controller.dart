import 'package:flutter/material.dart';

class LoadingWidgetController {
  LoadingWidgetController._();

  static final LoadingWidgetController instance = LoadingWidgetController._();

  static final ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);
  static final ValueNotifier<String> contentNotifier = ValueNotifier<String>("");

  bool loadingValue() => loadingNotifier.value;
  String contentValue() => contentNotifier.value;

  void loading() {
    loadingNotifier.value = true;
  }

  void close() {
    loadingNotifier.value = false;
  }

  void changeText(String value) {
    contentNotifier.value = value;
  }

  void clear() {
    close();
    changeText("");
  }
}
