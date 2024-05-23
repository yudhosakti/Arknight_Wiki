import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';


class PromotionOperatorWidget extends StatelessWidget {
  const PromotionOperatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(maxHeight: double.infinity),
      color: Color.fromRGBO(133, 132, 118, 1),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.04,
            color: Colors.greenAccent,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      "Elite 1",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      "Elite 2",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            crossAxisCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: MediaQuery.of(context).size.height * 0.005),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/8.png"),
                          fit: BoxFit.fitHeight),
                      color: Colors.white,
                      shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: MediaQuery.of(context).size.width * 0.045,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.024,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          constraints:
                              BoxConstraints(maxWidth: double.infinity),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: Text(
                              "10",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.count(2, 1.75),
          )
        ],
      ),
    );
  }
}