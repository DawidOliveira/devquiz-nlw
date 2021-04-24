import 'package:DevQuiz/app/core/app_colors.dart';
import 'package:DevQuiz/app/core/core.dart';
import 'package:DevQuiz/app/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.completed,
      required this.percent,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridTile(
            header: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(AppImages.blocks),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "$title",
                style: AppTextStyles.heading15,
              ),
            ),
            footer: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '$completed',
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                    value: percent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
