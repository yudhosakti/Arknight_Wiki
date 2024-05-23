import 'package:arknight_wiki/provider/animated_provider.dart';
import 'package:arknight_wiki/provider/operator_information_provider.dart';
import 'package:arknight_wiki/provider/riverpod_animated.dart';
import 'package:arknight_wiki/provider/riverpod_operator_information.dart';
import 'package:arknight_wiki/view/widget/operator/dropdown_custom_widget.dart';
import 'package:arknight_wiki/view/widget/operator/operator_ability_information_widget.dart';
import 'package:arknight_wiki/view/widget/operator/operator_showcase_item_widget.dart';
import 'package:arknight_wiki/view/widget/operator/operator_talent_widget.dart';
import 'package:arknight_wiki/view/widget/operator/promotion_operator_widget.dart';
import 'package:arknight_wiki/view/widget/operator/similar_operator_widget.dart';
import 'package:arknight_wiki/view/widget/operator/stat_description_widget.dart';
import 'package:arknight_wiki/view/widget/others/description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(mainContainerAnimation);
            return DropDownWidgetCustom(
              title: "Operator Max Stats",
              animationContainer: animationContainer,
              customInformation: StatDescriptionWidget(),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(descriptionContainerAnimation);
            return DropDownWidgetCustom(
              title: "Operator Description",
              animationContainer: animationContainer,
              customInformation: DescriptionWIdget(
                  text:
                      "Vendela, a florist who survived when war came. Now doing what she can to rebuild her little greenhouse."),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(promotionContainerAnimation);
            return DropDownWidgetCustom(
                title: "Operator Promotion Materials",
                animationContainer: animationContainer,
                customInformation: Consumer(builder: (context, ref, child) {
                  final OperatorInformationProvider promotion =
                      ref.watch(changeSkillOperator);
                  return PromotionOperatorWidget(
                    operatorInformationProvider: promotion,
                  );
                }));
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(traitContainerAnimation);
            return DropDownWidgetCustom(
              title: "Operator Trait",
              animationContainer: animationContainer,
              customInformation: DescriptionWIdget(
                  text:
                      "Restores the HP of allied units and recovers Elemental Damage by 50% of ATK (can recover Elemental Damage of unhurt allied units)"),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(talentContainerAnimation);
            return DropDownWidgetCustom(
              title: "Operator Talent",
              animationContainer: animationContainer,
              customInformation: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                constraints: BoxConstraints(maxHeight: double.infinity),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.005),
                      child: OperatorTalentWidget(
                          description: ref
                              .read(changeSkillOperator)
                              .talentsDummy[index]
                              .description,
                          name: ref
                              .read(changeSkillOperator)
                              .talentsDummy[index]
                              .talentName,
                          index: index),
                    );
                  },
                ),
              ),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(abilityContainerAnimation);
            return DropDownWidgetCustom(
              title: "Operator Ability & Material",
              animationContainer: animationContainer,
              customInformation: Consumer(builder: (context, ref, child) {
                final OperatorInformationProvider operatorInformationProvider =
                    ref.watch(changeSkillOperator);
                return OperatorAbilityInformationWidget(
                    operatorInformationProvider: operatorInformationProvider);
              }),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(showcaseContainerAnimation);
            return DropDownWidgetCustom(
                title: "Operator Showcase",
                animationContainer: animationContainer,
                customInformation: OperatorShowcaseItemWidget());
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Consumer(builder: (context, ref, child) {
            final AnimatedProvider animationContainer =
                ref.watch(similarContainerAnimation);
            return DropDownWidgetCustom(
                title: "Similar Operator",
                animationContainer: animationContainer,
                customInformation: SimilarOperatorWidget());
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          )
        ],
      ),
    );
  }
}
