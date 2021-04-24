import 'dart:math';

import 'package:DevQuiz/app/core/app_colors.dart';
import 'package:DevQuiz/app/core/app_images.dart';
import 'package:DevQuiz/app/modules/home/home_repository.dart';
import 'package:DevQuiz/app/modules/home/home_state.dart';
import 'package:DevQuiz/app/shared/models/answer.dart';
import 'package:DevQuiz/app/shared/models/question.dart';
import 'package:DevQuiz/app/shared/models/quiz.dart';
import 'package:DevQuiz/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeController {
  final List<String> levelList = ["Fácil", "Médio", "Difícil", "Perito"];

  final Map<String, Map<String, Color>> config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "textColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "textColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "textColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "textColor": AppColors.levelButtonTextPerito,
    },
  };

  final stateNotifier = ValueNotifier(HomeState.empty);
  void setState(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final _repository = HomeRepository();

  void getUser() async {
    this.setState(HomeState.loading);
    user = await _repository.getUser();
    this.setState(HomeState.success);
  }

  void getQuizzes() async {
    this.setState(HomeState.loading);
    quizzes = await _repository.getQuizzes();
    this.setState(HomeState.success);
  }
}
