import 'package:flutter/material.dart';

class QuizController {
  final selectedIndex = ValueNotifier(-1);
  int get getSelectedIndex => selectedIndex.value;
  set setSelectedIndex(int value) => selectedIndex.value = value;
}
