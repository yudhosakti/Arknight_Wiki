import 'package:arknight_wiki/view/widget/operator/operator_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RecentOperatorWIdget extends StatelessWidget {
  const RecentOperatorWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.19,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.008),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Operator",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Show All",
                          style: GoogleFonts.poppins(
                              color: Color.fromRGBO(18, 205, 217, 1),
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return OperatorIconWidget(
                    isCircle: true,
                    colorText: Colors.white,
                    image:
                        "https://sanitygone.help/images/avatars/char_4064_mlynar.png",
                    name: "Mylnar",
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
