import 'package:arknight_wiki/provider/operator_class_banner_provider.dart';
import 'package:arknight_wiki/provider/riverpod_banner.dart';
import 'package:arknight_wiki/view/widget/operator/operator_icon_widget.dart';
import 'package:arknight_wiki/view/widget/operator/search_operator_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class OperatorPage extends ConsumerWidget {
  const OperatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SearchOperatorWidget(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TitleOnlyWidget(judul: "Menu Category"),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                              bottom: Radius.circular(12)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://static.wikia.nocookie.net/mrfz/images/c/c8/Rhodes_Island.png/revision/latest/scale-to-width-down/510?cb=20210713014317'),
                              fit: BoxFit.fill)),
                    ),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Operator",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )))
                  ],
                ),
              ),
            );
          },
        ),
        TitleOnlyWidget(judul: "Operator Class"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.003,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: CarouselSlider(
              items: ref
                  .read(operatorClassBannerRiverpod)
                  .classOperator
                  .map((component) => Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  IntrinsicWidth(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0035),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Center(
                                          child: Text(
                                            "  ${component.nameClass}  ",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.005),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    component.imageClass),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.005),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.008,
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.001),
                                              child: Text(
                                                softWrap: true,
                                                maxLines: 5,
                                                overflow: TextOverflow.fade,
                                                component.descriptionClass,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  initialPage: ref.read(operatorClassBannerRiverpod).posisition,
                  onPageChanged: (index, reason) {
                    ref
                        .read(operatorClassBannerRiverpod)
                        .changePosisition(index);
                  },
                  height: MediaQuery.of(context).size.height * 0.2)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Consumer(builder: (context, ref, child) {
            final OperatorClassBannerProvider model =
                ref.watch(operatorClassBannerRiverpod);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01),
                        child: Text(
                          "Popular ${model.classOperator[model.posisition].nameClass} Operator",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                      itemCount: model
                          .classOperator[model.posisition].operators.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OperatorIconWidget(
                            isCircle: true,
                            colorText: Colors.white,
                            image: model.classOperator[model.posisition]
                                .operators[index].image,
                            name: model.classOperator[model.posisition]
                                .operators[index].name);
                      },
                    ),
                  ))
                ],
              ),
            );
          }),
        ),
        TitleOnlyWidget(judul: "Enemy Information"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: Container(
            child: CarouselSlider(
                items: ref
                    .read(enemyBannerRiverpod)
                    .enemies
                    .map((e) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.003,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.008),
                                      child: IntrinsicWidth(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Center(
                                            child: Text(
                                              "  ${e.category}  ",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.005),
                                  child: Text(
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      e.description,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: e.enemies.length,
                                  itemBuilder: (context, index) {
                                    return OperatorIconWidget(
                                      isCircle: false,
                                      image: e.enemies[index].image,
                                      name: e.enemies[index].name,
                                      colorText: Colors.white,
                                    );
                                  },
                                ),
                              ))
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * 0.27,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) =>
                      ref.read(enemyBannerRiverpod).changePosition(index),
                )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TitleOnlyWidget(judul: "Story Stage Preview"),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://static.wikia.nocookie.net/mrfz/images/8/84/EN_Episode_9_Stormwatch_banner.png/revision/latest?cb=20220314031340"),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: MediaQuery.of(context).size.width * 0.1,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.58,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color.fromRGBO(37, 40, 54, 0.8)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Theme : Chapter 9 Stromwatch",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                  Text("Total Stage : 20",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white)),
                                  Text(
                                    "Total PO : 30",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class TitleOnlyWidget extends StatelessWidget {
  final String judul;
  const TitleOnlyWidget({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.04,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
          child: Text(
            judul,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
