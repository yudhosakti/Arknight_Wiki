import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchOperatorWidget extends StatelessWidget {
  const SearchOperatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        child: TextField(
          autocorrect: false,
          enableSuggestions: false,
          style: GoogleFonts.poppins(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.filter_center_focus,
                color: Colors.white,
              ),
              fillColor: Color.fromRGBO(37, 40, 54, 1),
              filled: true,
              hintText: "Search operator",
              hintStyle: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w500),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)))),
        ),
      ),
    );
  }
}