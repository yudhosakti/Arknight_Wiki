import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SkillActivationDetailWidget extends StatelessWidget {
  final String value;
  final String title;
  const SkillActivationDetailWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.005),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.025,
              child: Center(
                child: Text(
                  "$title : ",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
            Expanded(
                child: Container(
                    child: Center(
              child: Text(
                "$value",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: Color.fromRGBO(59, 196, 237, 1)),
              ),
            )))
          ],
        ),
      ),
    );
  }
}