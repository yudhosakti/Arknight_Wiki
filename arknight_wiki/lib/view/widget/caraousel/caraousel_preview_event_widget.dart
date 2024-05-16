import 'package:arknight_wiki/provider/riverpod_banner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class CaraouselPreviewEventWidget extends StatelessWidget {
  final WidgetRef ref;
  const CaraouselPreviewEventWidget({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
          carouselController: CarouselController(),
      options: CarouselOptions(
          onPageChanged: (index, reason) {
            ref.read(bannerProvider).changePotition(index);
          },
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          animateToClosest: true,
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height * 0.25),
      items: ref
          .read(bannerProvider)
          .banner
          .map((item) => Container(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromRGBO(71, 76, 84, 0.2),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.008),
                                  child: Text(
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    "${item.title}\n${item.startDate}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(item.image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
              ))
          .toList(),
    ));
  }
}