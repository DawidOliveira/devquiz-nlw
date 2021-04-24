import 'package:DevQuiz/app/shared/utils/app_route.dart';
import 'package:flutter/material.dart';

class SplashController {
  Future<void> init(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(Routes.HOME);
  }
}
