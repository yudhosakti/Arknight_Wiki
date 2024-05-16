import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.2,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.giantbomb.com/a/uploads/scale_medium/40/408625/3083867-arknights.jpg"),
                    fit: BoxFit.fitWidth),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
          Text(
            "ARKNIGHT WIKI",
            style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}