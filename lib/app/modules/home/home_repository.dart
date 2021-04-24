import 'dart:convert';

import 'package:DevQuiz/app/shared/models/quiz.dart';
import 'package:DevQuiz/app/shared/models/user.dart';
import 'package:flutter/services.dart';

abstract class IHomeRepository {
  Future<UserModel> getUser();
  Future<List<QuizModel>> getQuizzes();
}

class HomeRepository implements IHomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");

    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final quizzes = (jsonDecode(response) as List)
        .map((e) => QuizModel.fromMap(e))
        .toList();

    return quizzes;
  }
}
