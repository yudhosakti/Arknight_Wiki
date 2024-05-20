import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color.fromRGBO(31, 35, 79, 1)),
          child: Center(
            child: Text(
              "  $title  ",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}