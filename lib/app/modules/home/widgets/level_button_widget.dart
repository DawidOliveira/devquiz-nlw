import 'package:DevQuiz/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final HomeController controller;

  LevelButtonWidget({Key? key, required this.label, required this.controller})
      : assert(controller.levelList.contains(label)),
        super(key: key);

  Color get color => controller.config[label]!["color"]!;
  Color get borderColor => controller.config[label]!['borderColor']!;
  Color get textColor => controller.config[label]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 6,
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: textColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
