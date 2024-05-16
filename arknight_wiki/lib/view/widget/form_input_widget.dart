import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FormInputWidget extends StatelessWidget {
  const FormInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              color: Color.fromRGBO(39, 40, 43, 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.008,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: TextFormField(
                textDirection: TextDirection.ltr,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.start,
                showCursor: true,
                cursorColor: Colors.white,
                autocorrect: false,
                enableSuggestions: false,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.poppins(
                    height: 2.0, color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: GoogleFonts.poppins(
                        height: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    contentPadding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.008,
                        bottom: MediaQuery.of(context).size.height * 0.031),
                    alignLabelWithHint: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelStyle: GoogleFonts.poppins(
                        height: 2.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    label: Text("Full Name"))),
          ),
        )
      ],
    );
  }
}