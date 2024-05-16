import 'dart:ui';
import 'package:arknight_wiki/provider/riverpod_banner.dart';
import 'package:arknight_wiki/view/widget/caraousel/caraousel_preview_event_widget.dart';
import 'package:arknight_wiki/view/widget/caraousel/recent_banner_widget.dart';
import 'package:arknight_wiki/view/widget/operator/recent_operator_widget.dart';
import 'package:arknight_wiki/view/widget/operator/search_operator_widget.dart';
import 'package:arknight_wiki/view/widget/profile_card_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  HomePage({super.key});

  double getWidth() {
    FlutterView view = PlatformDispatcher.instance.views.first;

    double physicalWidth = view.physicalSize.width;

    double devicePixelRatio = view.devicePixelRatio;

    double screenWidth = physicalWidth / devicePixelRatio;
    return screenWidth;
  }

  double getHeight() {
    FlutterView view = PlatformDispatcher.instance.views.first;
    double physicalHeight = view.physicalSize.height;

    double devicePixelRatio = view.devicePixelRatio;
    double screenHeight = physicalHeight / devicePixelRatio;
    return screenHeight;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const ProfileCardWidget(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const SearchOperatorWidget(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        CaraouselPreviewEventWidget(ref: ref),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.034,
            child: Align(
              alignment: Alignment.topCenter,
              child: DotsIndicator(
                  position: ref.watch(bannerProvider).potition,
                  dotsCount: ref.read(bannerProvider).banner.length,
                  decorator: DotsDecorator(
                      color: Colors.white,
                      activeColor: Color.fromRGBO(18, 205, 217, 1),
                      activeShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      activeSize: Size(MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.height * 0.03))),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const RecentOperatorWIdget(),
        RecentBannerWidget(
          ref: ref,
        )
      ],
    );
  }
}
