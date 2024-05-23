import 'package:arknight_wiki/models/skill_operator_detail_model.dart';
import 'package:arknight_wiki/models/talent_operator_model.dart';
import 'package:flutter/material.dart';

class OperatorInformationProvider extends ChangeNotifier {
  List<SkillOperatorDetailModel> skillsModelsDemo = [
    SkillOperatorDetailModel(
      duration: "40",
      image:
          "https://gamepress.gg/arknights/sites/arknights/files/game-images/skills/skill_icon_skcom_quickattack%5B3%5D.png",
      name: "Swift Strike γ",
      skillActivation: "Manual",
      spChargeType: "Per Seconds",
      skillEffectsMaterials: [
        SkillEffectsMaterials(
            initialSp: 20,
            spCost: 40,
            materialsList: [
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
            ],
            skillEffects: "ATK +20%; ASPD +20"),
        SkillEffectsMaterials(
            initialSp: 22,
            spCost: 38,
            materialsList: [
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
            ],
            skillEffects: "ATK +20%; ASPD +20"),
        SkillEffectsMaterials(
            initialSp: 24,
            spCost: 36,
            materialsList: [
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
            ],
            skillEffects: "ATK +20%; ASPD +20")
      ],
    ),
    SkillOperatorDetailModel(
      duration: "Infinity",
      image:
          "https://gamepress.gg/arknights/sites/arknights/files/2023-07/%E6%8A%80%E8%83%BD_%E5%86%B0%E5%8E%9F%E7%A7%A9%E5%BA%8F.png",
      name: "Order of the Icefield",
      skillActivation: "Manual",
      spChargeType: "Per Seconds",
      skillEffectsMaterials: [
        SkillEffectsMaterials(
            initialSp: 20,
            spCost: 40,
            materialsList: [
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
              Materials(
                  quantity: 10,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
            ],
            skillEffects: "ATK +20%; ASPD +20"),
        SkillEffectsMaterials(
            initialSp: 22,
            spCost: 40,
            materialsList: [
              Materials(
                  quantity: 5,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
              Materials(
                  quantity: 4,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
            ],
            skillEffects:
                "ATK +17%, each attack fires off 2 arrows (prioritizing different targets), and has a 40% chance of stunning targets for 1 seconds \nFrom second activation and on, this skill has unlimited duration"),
        SkillEffectsMaterials(
            initialSp: 24,
            spCost: 40,
            materialsList: [
              Materials(
                  quantity: 9,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
              Materials(
                  quantity: 7,
                  id_materials: "1",
                  image:
                      "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/material/66.png",
                  name: "Crystalline Circuit"),
            ],
            skillEffects:
                "ATK +20%, each attack fires off 2 arrows (prioritizing different targets), and has a 40% chance of stunning targets for 1 seconds \nFrom second activation and on, this skill has unlimited duration")
      ],
    )
  ];

  List<TalentOperatorModel> talentsDummy = [
     TalentOperatorModel(
      description: "When attacking a target, there is 40% chance to attack another random target within Attack Range, dealing 40% Arts damage", 
      talentName: "Lexicon Evolution"),
      TalentOperatorModel(
      description: "Attacks inflict -10 RES to the target and increase their Arts damage taken by 150 for 5 seconds", 
      talentName: "Soul-shearing Tools"),
  ];

  bool isInformation = true;
  int chooseSkill = 0;
  int indexChooseSkillEffect = 0;

  void changeValueInformation(bool newValue) {
    isInformation = newValue;
    notifyListeners();
  }

  void changeIndexChooseSkillEffect(int newValue) {
    indexChooseSkillEffect = newValue;
    notifyListeners();
  }

  void changeSkillOperaatorIndex(int newValue) {
    chooseSkill = newValue;
    indexChooseSkillEffect = 0;
    notifyListeners();
  }
}
