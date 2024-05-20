import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AbilityCostCustomWidget extends StatelessWidget {
  final String title;
  final String cost;
  const AbilityCostCustomWidget(
      {super.key, required this.cost, required this.title});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Color.fromRGBO(15, 104, 138, 1),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Text(
            "  $title : $cost  ",
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
      ),
    );
  }
}