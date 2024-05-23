import 'package:arknight_wiki/provider/operator_information_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class PromotionOperatorWidget extends StatelessWidget {
  final OperatorInformationProvider operatorInformationProvider;
  const PromotionOperatorWidget(
      {super.key, required this.operatorInformationProvider});

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
                GestureDetector(
                  onTap: () => operatorInformationProvider.changePromotion(0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height,
                    color: operatorInformationProvider.choosePromotion == 0
                        ? Colors.blueAccent
                        : Colors.grey,
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
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () => operatorInformationProvider.changePromotion(1),
                  child: Container(
                    color: operatorInformationProvider.choosePromotion == 0
                        ? Colors.grey
                        : Colors.blueAccent,
                    child: Center(
                      child: Text(
                        "Elite 2",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Builder(builder: (context) {
            if (operatorInformationProvider.choosePromotion >
                operatorInformationProvider.promotionDummy.length - 1) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Center(
                  child: Text(
                    "No Data Yet",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              );
            } else {
              return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: operatorInformationProvider
                    .promotionDummy[operatorInformationProvider.choosePromotion]
                    .materials
                    .length,
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
                              image: NetworkImage(operatorInformationProvider
                                  .promotionDummy[operatorInformationProvider
                                      .choosePromotion]
                                  .materials[index]
                                  .image),
                              fit: BoxFit.fitHeight),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: MediaQuery.of(context).size.width * 0.045,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.024,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              constraints:
                                  BoxConstraints(maxWidth: double.infinity),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.01),
                                child: Text(
                                  operatorInformationProvider
                                      .promotionDummy[
                                          operatorInformationProvider
                                              .choosePromotion]
                                      .materials[index]
                                      .quantity
                                      .toString(),
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
              );
            }
          })
        ],
      ),
    );
  }
}
