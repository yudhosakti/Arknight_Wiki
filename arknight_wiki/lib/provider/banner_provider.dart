import 'package:arknight_wiki/models/banner_model.dart';
import 'package:arknight_wiki/models/gacha_banner_model.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  int potition = 0;
  int bannerPosition = 0;

   List<BannerModel> banner = [
    BannerModel(
        image:
            "https://webusstatic.yo-star.com/uy0news/ae/fc0dcdd9d1b9d73e4a9f03dab7267cff.jpg",
        startDate: "2024-04-08",
        title: "Design of Strife"),
    BannerModel(
        image:
            "https://asetto.nawalakarsa.id/imeji/20230219232318/Near-Light-1-min.png",
        startDate: "2024-04-08",
        title: "Near Light"),
    BannerModel(
        image:
            "https://gamerbraves.sgp1.cdn.digitaloceanspaces.com/2022/10/akcn3.5-il-siracusano.jpg",
        startDate: "2024-04-08",
        title: "Siracusa"),
    BannerModel(
        image:
            "https://imgeucdn.gamespress.com/cdn/files/Games%20Press/2023/07/130724-351900b5/1.jpg?w=540&mode=max&otf=y&quality=90&format=jpg&bgcolor=white&ex=2024-06-01+03%3A00%3A00&sky=554a1654bec79cbca17dafe235d3413273a8412cec34f61db1da04a0a8e76596",
        startDate: "2024-04-08",
        title: "What The Firelight Cast "),
  ];

  List<GachaBannerModel> gachaBanners = [
    GachaBannerModel(
        date: "2024-04-08",
        image:
            "https://static.wikia.nocookie.net/mrfz/images/7/7b/CN_Here_I_Stand_banner.png/revision/latest/scale-to-width-down/1650?cb=20230504032252",
        rateup: [
          RateUpModel(
              image:
                  "https://arknights.wiki.gg/images/thumb/4/45/Muelsyse_Elite_2_icon.png/100px-Muelsyse_Elite_2_icon.png",
              name: "Mumu"),
          RateUpModel(
              image:
                  "https://arknights.wiki.gg/images/0/02/Ho%27olheyak_icon.png",
              name: "Hoolheyak")
        ],
        title: "Here I Stand"),
    GachaBannerModel(
        date: "2024-04-08",
        image: "https://arknights.wiki.gg/images/0/0a/CN_By_My_Will_banner.png",
        rateup: [
          RateUpModel(
              image:
                  "https://arknights.wiki.gg/images/thumb/7/75/Virtuosa_Elite_2_icon.png/100px-Virtuosa_Elite_2_icon.png",
              name: "Virtuosa"),
          RateUpModel(
              image:
                  "https://arknights.wiki.gg/images/thumb/3/36/Viviana_Elite_2_icon.png/100px-Viviana_Elite_2_icon.png",
              name: "Viviana")
        ],
        title: "Be My Will")
  ];

  void changePotition(int newPosition) {
    potition = newPosition;
    notifyListeners();
  }

  void changeBannerPosition(int newPosition) {
    bannerPosition = newPosition;
    notifyListeners();
  }
}
