import 'package:arknight_wiki/provider/animated_provider.dart';
import 'package:arknight_wiki/provider/riverpod_animated.dart';
import 'package:arknight_wiki/view/widget/operator/dropdown_custom_widget.dart';
import 'package:arknight_wiki/view/widget/others/description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class EnemyDetailPage extends StatelessWidget {
  const EnemyDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return Column(
              children: [
                IntroductionDetailWidget(
                  iconItem: "https://arknights.wiki.gg/images/1/11/W_%28enemy%29_icon.png",
                  landscapeImage: "https://static.wikia.nocookie.net/mrfz/images/5/5c/Kings_of_the_Sarkaz.png/revision/latest?cb=20220423034012",
                  nameItem: "W The Mercenary",
                  typeItem: "Elite Enemy",
                ),
                Consumer(builder: (context, ref, child) {
                  final AnimatedProvider animatedProvider =
                      ref.watch(detailEnemyDescriptionAnimation);
                  return DropDownWidgetCustom(
                      title: "Enemy Description",
                      customInformation: DescriptionWIdget(
                          text:
                              "A Sarkaz Mercenary and one of Reunion's squad leaders, she carries around a weapon that resembles a Laterano Gun. However, she almost exclusively attacks using explosives and throwing weapons. One of her common strategies is to attack the enemy's flank using large amounts of active Originium explosives. However, her erratic movements make her almost impossible to predict"),
                      animationContainer: animatedProvider);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Consumer(builder: (context, ref, child) {
                  final AnimatedProvider animatedProvider =
                      ref.watch(detailEnemyStatsAnimation);
                  return DropDownWidgetCustom(
                      title: "Enemy Stats",
                      customInformation: EnemyStatsCompleteBuildWidget(),
                      animationContainer: animatedProvider);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Consumer(builder: (context, ref, child) {
                  final AnimatedProvider animatedProvider =
                      ref.watch(detailEnemyApperanceAnimation);
                  return DropDownWidgetCustom(
                      title: "Enemy Appearances",
                      customInformation: EnemyAppearancesWidget(),
                      animationContainer: animatedProvider);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            );
          })),
        ],
      ),
    );
  }
}

class IntroductionDetailWidget extends StatelessWidget {
  final String landscapeImage;
  final String iconItem;
  final String nameItem;
  final String typeItem;
  const IntroductionDetailWidget({
    super.key,
    required this.iconItem,
    required this.landscapeImage,
    required this.nameItem,
    required this.typeItem
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        landscapeImage),
                    fit: BoxFit.fill)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: MediaQuery.of(context).size.width * 0.01,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color.fromRGBO(55, 63, 74, 1)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                          vertical: MediaQuery.of(context).size.height * 0.005),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    iconItem),
                                fit: BoxFit.contain),
                            color: Colors.grey[300],
                            shape: BoxShape.circle),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameItem,
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            typeItem,
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.05,
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class EnemyAppearancesWidget extends StatelessWidget {
  const EnemyAppearancesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
      color: Color.fromRGBO(60, 67, 77, 1),
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.zero,
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: Text(
                  "TR-8",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.count(2, 1),
      ),
    );
  }
}

class EnemyStatsCompleteBuildWidget extends StatelessWidget {
  const EnemyStatsCompleteBuildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      color: Color.fromRGBO(60, 67, 77, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EnemyStatsWidget(title: "HP", value: "S"),
          EnemyStatsWidget(
            title: "Attack",
            value: "A",
          ),
          EnemyStatsWidget(
            title: "Def",
            value: "D",
          ),
          EnemyStatsWidget(
            title: "Res",
            value: "A",
          )
        ],
      ),
    );
  }
}

class EnemyStatsWidget extends StatelessWidget {
  final String title;
  final String value;
  const EnemyStatsWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height,
        color: Colors.amberAccent,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.03,
              color: Colors.black,
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.003),
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
