import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OperatorIconWidget extends StatelessWidget {
  final String image;
  final String name;
  final Color colorText;
  final bool isCircle;
  const OperatorIconWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.isCircle,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.23,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.contain),
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                color: isCircle ? Colors.grey[300] : null),
          ),
          Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    name,
                    style: GoogleFonts.poppins(
                        color: colorText, fontWeight: FontWeight.w500),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
