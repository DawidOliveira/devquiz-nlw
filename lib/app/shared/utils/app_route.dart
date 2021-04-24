import 'package:DevQuiz/app/modules/challenge/challenge_page.dart';
import 'package:DevQuiz/app/modules/home/home_page.dart';
import 'package:DevQuiz/app/modules/splash/splash_page.dart';
import 'package:DevQuiz/app/shared/models/question.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._Routes();

  static const SPLASH = '/';
  static const HOME = '/home';
  static const CHALLENGE = '/challenge';
}

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case Routes.SPLASH:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );
      case Routes.CHALLENGE:
        final args = settings.arguments as List<QuestionModel>;
        return MaterialPageRoute(
          builder: (_) => ChallengePage(
            questions: args,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('404 not found!'),
          ),
        );
    }
  }
}
