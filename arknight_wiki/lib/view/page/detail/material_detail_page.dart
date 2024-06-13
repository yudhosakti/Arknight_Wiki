import 'package:arknight_wiki/provider/animated_provider.dart';
import 'package:arknight_wiki/provider/riverpod_animated.dart';
import 'package:arknight_wiki/view/page/detail/enemy_detail_page.dart';
import 'package:arknight_wiki/view/widget/operator/dropdown_custom_widget.dart';
import 'package:arknight_wiki/view/widget/others/description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialDetailPage extends StatelessWidget {
  const MaterialDetailPage({super.key});

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
                    iconItem:
                        "https://static.wikia.nocookie.net/mrfz/images/a/a3/Incandescent_Alloy_Block.png/revision/latest?cb=20200531052456",
                    landscapeImage:
                        "https://images.alphacoders.com/135/thumb-1920-1353399.jpg",
                    nameItem: "Incandescent Alloy Block",
                    typeItem: "T4 Material"),
                Consumer(builder: (context, ref, child) {
                  final AnimatedProvider animatedProvider =
                      ref.watch(detailMaterialDescriptionAnimation);
                  return DropDownWidgetCustom(
                      title: "Material Description",
                      customInformation: DescriptionWIdget(
                          text:
                              "A rarely-produced alloy with a high melting point, commonly used in the electronics industry. Can be used for a variety of upgrades. \nA product derived from further processing of incandescent alloy. After complicated industrial processing, the stability of its solid-liquid hybridization state at certain temperatures has been preserved. As a result, it has an irreplaceable role in product development in the cutting-edge electronics industry"),
                      animationContainer: animatedProvider);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Consumer(builder: (context, ref, child) {
                  final AnimatedProvider animatedProvider =
                      ref.watch(detailMaterialApperanceAnimation);
                  return DropDownWidgetCustom(
                      title: "Material Appearances",
                      customInformation: MaterialApperancesWidget(),
                      animationContainer: animatedProvider);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Consumer(builder: (context, ref, child) {
                  final AnimatedProvider animatedProvider =
                      ref.watch(detailMaterialCraftingAnimation);
                  return DropDownWidgetCustom(
                      title: "Material Crafting",
                      customInformation: MaterialDetailCraftingWidget(),
                      animationContainer: animatedProvider);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            );
          }))
        ],
      ),
    );
  }
}

class MaterialDetailCraftingWidget extends StatelessWidget {
  const MaterialDetailCraftingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.13,
      color: Color.fromRGBO(60, 67, 77, 1),
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.015,
                        vertical: MediaQuery.of(context).size.height * 0.005),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://static.wikia.nocookie.net/mrfz/images/f/f4/Incandescent_Alloy.png/revision/latest?cb=20200531052450")),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          minHeight: 0,
                          maxHeight: double.infinity,
                          minWidth: 0),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "123",
                          style: GoogleFonts.poppins(color: Colors.black),
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
    );
  }
}

class MaterialApperancesWidget extends StatelessWidget {
  const MaterialApperancesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
      color: Color.fromRGBO(60, 67, 77, 1),
      child: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text(
                              "Stage Code",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Center(
                            child: Text(
                              "Posibility To Get",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text(
                              "TR-10",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Center(
                            child: Text(
                              "Very Rare",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
