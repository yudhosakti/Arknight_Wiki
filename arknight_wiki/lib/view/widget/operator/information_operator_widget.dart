import 'package:arknight_wiki/provider/operator_information_provider.dart';
import 'package:arknight_wiki/provider/riverpod_operator_information.dart';
import 'package:arknight_wiki/view/widget/operator/ability_custom_widget.dart';
import 'package:arknight_wiki/view/widget/operator/operator_icon_widget.dart';
import 'package:arknight_wiki/view/widget/operator/skill_activation_detail_widget.dart';
import 'package:arknight_wiki/view/widget/operator/skill_button_operator_widget.dart';
import 'package:arknight_wiki/view/widget/others/description_widget.dart';
import 'package:arknight_wiki/view/widget/others/stats_text_wiget.dart';
import 'package:arknight_wiki/view/widget/others/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationOperatorWidget extends ConsumerWidget {
  const InformationOperatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "Operator Max Stat"),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatTextWidget(title: "Hp", value: "1974"),
                      StatTextWidget(title: "Def", value: "884"),
                      StatTextWidget(title: "Attack", value: "774"),
                      StatTextWidget(title: "Res", value: "20"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatTextWidget(title: "Dp", value: "18"),
                      StatTextWidget(title: "Block", value: "1"),
                      StatTextWidget(title: "Redeploy", value: "Fast"),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const TitleWidget(title: "Operator Trait"),
          DescriptionWIdget(
              text:
                  "Restores the HP of allied units and recovers Elemental Damage by 50% of ATK (can recover Elemental Damage of unhurt allied units)"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TitleWidget(title: "Operator Description"),
          DescriptionWIdget(
              text:
                  "Vendela, a florist who survived when war came. Now doing what she can to rebuild her little greenhouse."),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TitleWidget(title: "Operator Ability"),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Consumer(builder: (context, ref, child) {
              final OperatorInformationProvider operatorInformationProvider =
                  ref.watch(changeSkillOperator);
              return Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                  minWidth: MediaQuery.of(context).size.width,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                color: Color.fromRGBO(136, 137, 148, 0.5),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          itemCount: ref
                              .read(changeSkillOperator)
                              .skillsModelsDemo
                              .length,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index ==
                                ref.watch(changeSkillOperator).chooseSkill) {
                              return SkillButtonOperatorWidget(
                                  textColor: Colors.black,
                                  containerColor: Colors.white);
                            }
                            return GestureDetector(
                              onTap: () {
                                operatorInformationProvider
                                    .changeSkillOperaatorIndex(index);
                              },
                              child: SkillButtonOperatorWidget(
                                  textColor: Colors.white,
                                  containerColor: Colors.black),
                            );
                          },
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(130, 34, 27, 1),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.007),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.015),
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    image: DecorationImage(
                                        image: operatorInformationProvider
                                                    .skillsModelsDemo[
                                                        operatorInformationProvider
                                                            .chooseSkill]
                                                    .image ==
                                                ''
                                            ? NetworkImage(
                                                "https://gamepress.gg/arknights/sites/arknights/files/2020-06/ArtAsbestosS1.png")
                                            : NetworkImage(
                                                operatorInformationProvider
                                                    .skillsModelsDemo[
                                                        operatorInformationProvider
                                                            .chooseSkill]
                                                    .image),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Text(
                                "Skill ${operatorInformationProvider.chooseSkill + 1}: ${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].name}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.005),
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.005),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Row(
                          children: [
                            AbilityCostCustomWidget(
                              cost:
                                  "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillEffectsMaterials[operatorInformationProvider.indexChooseSkillEffect].spCost}",
                              title: "SP Cost",
                            ),
                            AbilityCostCustomWidget(
                              cost:
                                  "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillEffectsMaterials[operatorInformationProvider.indexChooseSkillEffect].initialSp}",
                              title: "Initial SP",
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        children: [
                          SkillActivationDetailWidget(
                            title: "Sp Charge Type",
                            value:
                                "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].spChargeType}",
                          ),
                          SkillActivationDetailWidget(
                            title: "Skill Activation",
                            value:
                                "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillActivation}",
                          ),
                          SkillActivationDetailWidget(
                            title: "Duration",
                            value:
                                "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].duration}",
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: IntrinsicHeight(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " Skill Effect",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillEffectsMaterials[operatorInformationProvider.indexChooseSkillEffect].skillEffects}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.27,
              color: Color.fromRGBO(136, 137, 148, 0.5),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                minHeight: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Consumer(builder: (context, ref, child) {
                final OperatorInformationProvider operatorInformationProvider =
                    ref.watch(changeSkillOperator);
                return StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    padding: EdgeInsets.zero,
                    crossAxisCount: 6,
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.count(2, 0.8),
                    itemBuilder: (context, index) {
                      if (index <
                          operatorInformationProvider
                              .skillsModelsDemo[
                                  operatorInformationProvider.chooseSkill]
                              .skillEffectsMaterials
                              .length) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              operatorInformationProvider
                                  .changeIndexChooseSkillEffect(index);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: index !=
                                          operatorInformationProvider
                                              .indexChooseSkillEffect
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Builder(builder: (context) {
                                  if (index + 1 > 7) {
                                    return Text(
                                      "Mastery ${index + 1 - 7}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: index !=
                                                  operatorInformationProvider
                                                      .indexChooseSkillEffect
                                              ? Colors.white
                                              : Colors.black),
                                    );
                                  } else {
                                    return Text(
                                      "Level ${index + 1}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: index !=
                                                  operatorInformationProvider
                                                      .indexChooseSkillEffect
                                              ? Colors.white
                                              : Colors.black),
                                    );
                                  }
                                }),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Center(
                              child: Text(
                                "No Data",
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }),
            ),
          ),
          TitleWidget(title: "Material Upgrade Cost"),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.015),
            child: Consumer(builder: (context, ref, child) {
              final OperatorInformationProvider operatorInformationProvider =
                  ref.watch(changeSkillOperator);
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListView.builder(
                  itemCount: operatorInformationProvider
                      .skillsModelsDemo[operatorInformationProvider.chooseSkill]
                      .skillEffectsMaterials[
                          operatorInformationProvider.indexChooseSkillEffect]
                      .materialsList
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      child: Stack(
                        children: [
                          OperatorIconWidget(
                              image:
                                  "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillEffectsMaterials[operatorInformationProvider.indexChooseSkillEffect].materialsList[index].image}",
                              name:
                                  "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillEffectsMaterials[operatorInformationProvider.indexChooseSkillEffect].materialsList[index].name}",
                              isCircle: true,
                              colorText: Colors.white),
                          Positioned(
                            right: 0,
                            bottom: MediaQuery.of(context).size.height * 0.05,
                            child: IntrinsicWidth(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                constraints: BoxConstraints(
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.1),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "${operatorInformationProvider.skillsModelsDemo[operatorInformationProvider.chooseSkill].skillEffectsMaterials[operatorInformationProvider.indexChooseSkillEffect].materialsList[index].quantity}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
          TitleWidget(title: "Operator Showcase"),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.015),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.ytimg.com/vi/Bkt-6O1edNw/maxresdefault.jpg"),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 32,
                                  )),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: Color.fromRGBO(48, 41, 41, 0.8),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.005),
                                child: Text(
                                  maxLines: 1,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  "[Arknights] Texas the Omertosa Showcase",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          TitleWidget(title: "Similar Operator"),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.015),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.012),
                    child: OperatorIconWidget(
                        image:
                            "https://static.wikia.nocookie.net/mrfz/images/f/f8/Phantom_icon.png/revision/latest?cb=20200426100549",
                        name: "Phantom",
                        isCircle: true,
                        colorText: Colors.white),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          )
        ],
      ),
    );
  }
}
