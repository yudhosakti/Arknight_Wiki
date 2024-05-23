import 'package:arknight_wiki/provider/operator_information_provider.dart';
import 'package:arknight_wiki/provider/reviews_provider.dart';
import 'package:arknight_wiki/provider/riverpod_operator_information.dart';
import 'package:arknight_wiki/view/widget/operator/information_operator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class OperatorDetailPage extends ConsumerWidget {
  const OperatorDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: ref.watch(changeLayout).isInformation
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.reviews,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
            ),
      backgroundColor: Color.fromRGBO(31, 29, 43, 1),
      appBar: null,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.01,
                  left: MediaQuery.of(context).size.width * 0.01,
                  top: MediaQuery.of(context).size.height * 0.05)),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://w.forfun.com/fetch/a5/a5b0e7d006cac1ad805fd074a99be8c8.jpeg"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Color.fromRGBO(42, 43, 43, 0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://gamepress.gg/arknights/sites/arknights/files/2022-11/TexalterAvatar.png"),
                                            fit: BoxFit.contain),
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              "Texas The Omertosa",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              "Class : Specialist",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              "Archetype : Executor",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 28,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.height,
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    )),
                              ),
                              Expanded(
                                  child: SizedBox(
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                    )),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 5,
                        child: IntrinsicWidth(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height,
                                  child: Icon(
                                    Icons.thumb_up,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  " 1775 ",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01),
                  child: Consumer(builder: (context, ref, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => ref
                                .read(changeLayout)
                                .changeValueInformation(true),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.47,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: ref.watch(changeLayout).isInformation
                                      ? Colors.white
                                      : Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "Information",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color:
                                          ref.watch(changeLayout).isInformation
                                              ? Colors.black
                                              : Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => ref
                                  .read(changeLayout)
                                  .changeValueInformation(false),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ref.watch(changeLayout).isInformation
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    "Reviews",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: ref
                                                .watch(changeLayout)
                                                .isInformation
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Consumer(builder: (context, ref, child) {
                  final OperatorInformationProvider
                      operatorInformationProvider = ref.watch(changeLayout);
                  if (operatorInformationProvider.isInformation) {
                    return InformationOperatorWidget();
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          child: Consumer(builder: (context, ref, child) {
                            final ReviewsProvider reviewsProvider =
                                ref.watch(changeExpandReviews);
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: reviewsProvider.reviewsDummy.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.005),
                                  child: IntrinsicHeight(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(55, 66, 77, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            constraints: BoxConstraints(
                                              minHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.005,
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.09,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "${reviewsProvider.reviewsDummy[index].image}"),
                                                            fit: BoxFit.fill),
                                                        shape: BoxShape.circle),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        child: Center(
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.01),
                                                            child: Text(
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              "${reviewsProvider.reviewsDummy[index].name}",
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.01),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.12,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        child: Center(
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.035,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12))),
                                                            child: Center(
                                                              child: Text(
                                                                "${reviewsProvider.reviewsDummy[index].rating}",
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01),
                                                  child: Builder(
                                                      builder: (context) {
                                                    if (reviewsProvider
                                                        .reviewsDummy[index]
                                                        .isExpanded) {
                                                      return Text(
                                                        maxLines: 6,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white),
                                                      ).animate().fadeIn();
                                                    } else {
                                                      return Text(
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white),
                                                      );
                                                    }
                                                  }),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.033,
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          onPressed: () {
                                                            reviewsProvider
                                                                .changeExpand(
                                                                    index);
                                                          },
                                                          icon: reviewsProvider
                                                                  .reviewsDummy[
                                                                      index]
                                                                  .isExpanded
                                                              ? Icon(
                                                                  Icons
                                                                      .arrow_drop_up,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    ).animate().fadeIn(),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    );
                  }
                }),
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}
