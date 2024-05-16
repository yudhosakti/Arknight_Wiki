import 'package:arknight_wiki/provider/riverpod_banner.dart';
import 'package:arknight_wiki/view/widget/operator/operator_icon_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class RecentBannerWidget extends StatelessWidget {
  final WidgetRef ref;
  const RecentBannerWidget({
    super.key,
    required this.ref
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Banner",
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
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    ref.read(gachaBannerProvider).changeBannerPosition(index);
                  },
                  initialPage: ref.read(gachaBannerProvider).bannerPosition,
                  autoPlayInterval: Duration(seconds: 5),
                  animateToClosest: true,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.2),
              items: ref
                  .read(gachaBannerProvider)
                  .gachaBanners
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(e.image),
                                fit: BoxFit.cover)),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Six Star Rate Up",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ref
                          .read(gachaBannerProvider)
                          .gachaBanners[
                              ref.watch(gachaBannerProvider).bannerPosition]
                          .rateup
                          .length,
                      itemBuilder: (context, index) {
                        return OperatorIconWidget(
                          isCircle: true,
                          colorText: Colors.white,
                          image: ref
                              .read(gachaBannerProvider)
                              .gachaBanners[
                                  ref.watch(gachaBannerProvider).bannerPosition]
                              .rateup[index]
                              .image,
                          name: ref
                              .read(gachaBannerProvider)
                              .gachaBanners[
                                  ref.watch(gachaBannerProvider).bannerPosition]
                              .rateup[index]
                              .name,
                        );
                      },
                    ),
                  ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}