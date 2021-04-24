import 'package:DevQuiz/app/core/app_text_styles.dart';
import 'package:DevQuiz/app/modules/challenge/widgets/answer_widget.dart';
import 'package:DevQuiz/app/modules/challenge/widgets/quiz/quiz_controller.dart';
import 'package:DevQuiz/app/shared/models/question.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChanged;

  const QuizWidget({Key? key, required this.question, required this.onChanged})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = QuizController();

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final answer = widget.question.answers[index];
              return ValueListenableBuilder<int>(
                valueListenable: controller.selectedIndex,
                builder: (_, value, __) => AnswerWidget(
                  disabled: controller.getSelectedIndex != -1,
                  answer: answer,
                  isSelected: value == index,
                  onTap: () {
                    controller.setSelectedIndex = index;
                    Future.delayed(Duration(seconds: 1), () {
                      widget.onChanged();
                    });
                  },
                ),
              );
            },
            itemCount: widget.question.answers.length,
          )
        ],
      ),
    );
  }
}
