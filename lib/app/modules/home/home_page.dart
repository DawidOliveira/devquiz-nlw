import 'package:DevQuiz/app/core/app_colors.dart';
import 'package:DevQuiz/app/modules/home/home_controller.dart';
import 'package:DevQuiz/app/modules/home/home_state.dart';
import 'package:DevQuiz/app/modules/home/widgets/app_bar_widget.dart';
import 'package:DevQuiz/app/modules/home/widgets/level_button_widget.dart';
import 'package:DevQuiz/app/modules/home/widgets/quiz_card_widget.dart';
import 'package:DevQuiz/app/shared/utils/app_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success)
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                    controller: controller,
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                    controller: controller,
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                    controller: controller,
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                    controller: controller,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                Routes.CHALLENGE,
                                arguments: e.questions,
                              );
                            },
                            percent: e.questionAnswered / e.questions.length,
                            title: '${e.title}',
                            completed:
                                '${e.questionAnswered} de ${e.questions.length}',
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
            backgroundColor: AppColors.white,
          ),
        ),
      );
  }
}
