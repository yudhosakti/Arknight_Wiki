import 'package:arknight_wiki/models/enemy_banner_model.dart';
import 'package:arknight_wiki/models/gacha_banner_model.dart';
import 'package:flutter/material.dart';

class EnemyBannerProvider extends ChangeNotifier {
  int position = 0;

  List<EnemyBannerModel> enemies = [
    EnemyBannerModel(
        category: "Boss Enemy",
        description:
            "Boss enemies are the strongest of all enemies and requires both specific strategies and concentrated DPS to be taken down before they can easily dispatch the Operators sent to stop them, thanks to their significant stats and a plethora of abilities to aid them in breaking through the defense line.",
        enemies: [
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/b/b7/Andoain%2C_the_%22Martyr%22_sprite.png/revision/latest?cb=20220315044733",
              name: "Andoain, the Martyr"),
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/4/40/Awaken_sprite.png/revision/latest?cb=20220706002720",
              name: "Awaken"),
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/b/be/Crownslayer_sprite.png/revision/latest?cb=20210520030853",
              name: "Crownslayer"),
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/5/5a/The_Deathless_Black_Snake_sprite.png/revision/latest?cb=20210522032827",
              name: "Talulah"),
        ]),
    EnemyBannerModel(
        category: "Elite Enemy",
        description:
            "Elite enemies are stronger than normal enemies and usually have various abilities that can aid them in breaking through the Operators, but usually appears in lower amounts than normal enemies.",
        enemies: [
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/c/c0/Alloy_Surfing_Instructor_sprite.png/revision/latest?cb=20220814090206",
              name: "Alloy Surfing Instructor"),
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/c/ca/Armed_Agent_Leader_sprite.png/revision/latest?cb=20230406065238",
              name: "Armed Agent Leader"),
          RateUpModel(
              image:
                  "https://static.wikia.nocookie.net/mrfz/images/1/1c/Avenger_sprite.png/revision/latest?cb=20210521001030",
              name: "Avenger"),
          RateUpModel(image: "https://static.wikia.nocookie.net/mrfz/images/3/3d/Blindey_sprite.png/revision/latest?cb=20210205183806", name: "Blindey"),
        ])
  ];

  void changePosition(int newIndex) {
    position = newIndex;
    notifyListeners();
  }
}
