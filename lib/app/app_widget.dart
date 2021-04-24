import 'package:DevQuiz/app/shared/utils/app_route.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
    );
  }
}
