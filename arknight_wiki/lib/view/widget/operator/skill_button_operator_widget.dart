import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SkillButtonOperatorWidget extends StatelessWidget {
  final Color textColor;
  final Color containerColor;
  const SkillButtonOperatorWidget(
      {super.key, required this.textColor, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            "Skill 1",
            style: GoogleFonts.poppins(color: textColor, fontSize: 18),
          ),
        ));
  }
}