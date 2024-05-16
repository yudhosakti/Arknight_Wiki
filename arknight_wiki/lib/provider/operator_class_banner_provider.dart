import 'package:arknight_wiki/models/gacha_banner_model.dart';
import 'package:arknight_wiki/models/operator_class_banner_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class OperatorClassBannerProvider extends ChangeNotifier {
  int posisition = 0;
  CarouselController caraouselController = CarouselController();

  OperatorClassBannerProvider({required this.posisition});

  List<OperatorClassBannerModel> classOperator = [
    OperatorClassBannerModel(
        descriptionClass:
            "Guards have high HP and ATK which gives them high DPS output. They often have good synergy with the other classes, especially Defenders who can block enemies to be pummeled by Guards or with each other to deal even more damage with coordinated attacks.",
        imageClass:
            "https://raw.githubusercontent.com/Aceship/Arknight-Images/main/classes/class_guard.png",
        nameClass: "Guard",
        operators: [
          RateUpModel(
              image:
                  "https://sanitygone.help/images/avatars/char_4064_mlynar.png",
              name: "Mylnar"),
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/game-images/avatars/char_172_svrash_1.png",
              name: "SilverAsh"),
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/2019-10/char_010_chen_1.png",
              name: "Chen"),
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/2020-08/char_293_thorns_1_Icon.png",
              name: "Thorn")
        ]),
    OperatorClassBannerModel(
        descriptionClass:
            "Casters attack enemies with their Originium Arts, dealing Arts damage instead of the usual Physical damage. This makes Casters a viable option when facing enemies with high DEF as they typically have little to no RES.",
        imageClass:
            "https://static.wikia.nocookie.net/mrfz/images/e/e6/Caster.png/revision/latest?cb=20210821062333",
        nameClass: "Caster",
        operators: [
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/2023-01/%E5%A4%B4%E5%83%8F_%E6%9E%97.png",
              name: "Lin"),
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/2022-06/char_4046_ebnhlz.png",
              name: "Ebenholdz"),
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/2022-02/char_377_gdglow.png",
              name: "Goldenglow"),
          RateUpModel(
              image:
                  "https://gamepress.gg/arknights/sites/arknights/files/2021-02/char_2015_dusk.png",
              name: "Dusk")
        ])
  ];

  void changePosisition(int newIndex) {
    posisition = newIndex;
    notifyListeners();
  }
}
