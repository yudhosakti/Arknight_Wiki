import 'package:arknight_wiki/provider/event_preview_provider.dart';
import 'package:arknight_wiki/provider/riverpod_banner.dart';
import 'package:arknight_wiki/view/widget/operator/operator_icon_widget.dart';
import 'package:arknight_wiki/view/widget/operator/search_operator_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SearchOperatorWidget(),
        DoubleTextWidget(
          title: "Recent Event CN",
        ),
        RecentEventCaraouselWidget(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.04,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Text(
                "Material Preview",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        MaterialPreviewWidget(),
        DoubleTextWidget(
          title: "Recent Event Global",
        ),
        RecentEventCaraouselWidget(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.04,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Text(
                "Material Preview",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        MaterialPreviewWidget(),
      ],
    );
  }
}

class DoubleTextWidget extends StatelessWidget {
  final String title;
  const DoubleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child: Text(
              "${title}",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Show All",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(18, 205, 217, 1)),
              ))
        ],
      ),
    );
  }
}

class MaterialPreviewWidget extends StatelessWidget {
  const MaterialPreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.005,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Consumer(builder: (context, ref, child) {
        final EventPreviewProvider eventPreviewProvider =
            ref.watch(previeEventBannerRiverpod);
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: ListView.builder(
            itemCount: eventPreviewProvider
                .previewEvents[eventPreviewProvider.indexChoose]
                .material
                .length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.005,
                    horizontal: MediaQuery.of(context).size.width * 0.005),
                child: OperatorIconWidget(
                    image: eventPreviewProvider
                        .previewEvents[eventPreviewProvider.indexChoose]
                        .material[index]
                        .materialImage,
                    name: eventPreviewProvider
                        .previewEvents[eventPreviewProvider.indexChoose]
                        .material[index]
                        .materialName,
                    isCircle: true,
                    colorText: Colors.white),
              );
            },
          ),
        );
      }),
    );
  }
}

class RecentEventCaraouselWidget extends ConsumerWidget {
  const RecentEventCaraouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider(
        items: ref.read(previeEventBannerRiverpod).previewEvents.map((e) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(e.image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.06),
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(37, 40, 54, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Event : ${e.name}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Total Originium Prime : ${e.totalCurrency}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Start Date : ${e.startDate}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
            initialPage: ref.read(previeEventBannerRiverpod).indexChoose,
            onPageChanged: (index, reason) {
              ref.read(previeEventBannerRiverpod).changeEvent(index);
            },
            enlargeCenterPage: true,
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height * 0.25));
  }
}
