import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWIdget extends StatelessWidget {
  final String text;
  const DescriptionWIdget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.004,
                horizontal: MediaQuery.of(context).size.width * 0.005),
            child: Text(
              "$text",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
