import 'package:arknight_wiki/provider/operator_information_provider.dart';
import 'package:arknight_wiki/view/widget/operator/ability_custom_widget.dart';
import 'package:arknight_wiki/view/widget/operator/skill_activation_detail_widget.dart';
import 'package:arknight_wiki/view/widget/operator/skill_button_operator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';


class OperatorAbilityInformationWidget extends StatelessWidget {
  const OperatorAbilityInformationWidget({
    super.key,
    required this.operatorInformationProvider,
  });

  final OperatorInformationProvider operatorInformationProvider;

  @override
  Widget build(BuildContext context) {
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
                  vertical: MediaQuery.of(context).size.height * 0.01),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.04,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                itemCount: operatorInformationProvider.skillsModelsDemo.length,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == operatorInformationProvider.chooseSkill) {
                    return SkillButtonOperatorWidget(
                        noSkill: index,
                        textColor: Colors.black,
                        containerColor: Colors.white);
                  }
                  return GestureDetector(
                    onTap: () {
                      operatorInformationProvider
                          .changeSkillOperaatorIndex(index);
                    },
                    child: SkillButtonOperatorWidget(
                        noSkill: index,
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
                  color: Color.fromRGBO(102, 17, 34, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.007),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.015),
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
                                  : NetworkImage(operatorInformationProvider
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
                horizontal: MediaQuery.of(context).size.width * 0.005),
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
                      height: MediaQuery.of(context).size.height * 0.03,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Skill Effect",
                          style: GoogleFonts.poppins(color: Colors.grey),
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
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisCount: 6,
              staggeredTileBuilder: (index) => StaggeredTile.count(2, 0.8),
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
                          borderRadius: BorderRadius.all(Radius.circular(12))),
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
              }),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.04,
            color: Color.fromRGBO(66, 107, 150, 1),
            child: Center(
              child: Text(
                "Material Upgrade Cost",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              staggeredTileBuilder: (index) => StaggeredTile.count(2, 1.7),
              crossAxisCount: 8,
              itemCount: operatorInformationProvider
                  .skillsModelsDemo[operatorInformationProvider.chooseSkill]
                  .skillEffectsMaterials[
                      operatorInformationProvider.indexChooseSkillEffect]
                  .materialsList
                  .length,
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
                                .skillsModelsDemo[
                                    operatorInformationProvider.chooseSkill]
                                .skillEffectsMaterials[
                                    operatorInformationProvider
                                        .indexChooseSkillEffect]
                                .materialsList[index]
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
                            height: MediaQuery.of(context).size.height * 0.024,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            constraints:
                                BoxConstraints(maxWidth: double.infinity),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Text(
                                operatorInformationProvider
                                    .skillsModelsDemo[
                                        operatorInformationProvider.chooseSkill]
                                    .skillEffectsMaterials[
                                        operatorInformationProvider
                                            .indexChooseSkillEffect]
                                    .materialsList[index]
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
            ),
          ),
        ],
      ),
    );
  }
}