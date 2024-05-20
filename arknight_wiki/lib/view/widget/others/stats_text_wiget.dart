import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class StatTextWidget extends StatelessWidget {
  final String title;
  final String value;
  const StatTextWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${title} : $value",
      style: GoogleFonts.poppins(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}