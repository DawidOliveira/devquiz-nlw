import 'package:flutter/material.dart';

class ChallengeController {
  final currentPage = ValueNotifier(0);
  int get getCurrentPage => currentPage.value;
  set setCurrentPage(int value) => currentPage.value = value;

  final pageController = PageController();
  Future<void> nextPage() async {
    await pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}
