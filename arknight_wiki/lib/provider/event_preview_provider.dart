import 'package:arknight_wiki/models/event_model.dart';
import 'package:flutter/material.dart';

class EventPreviewProvider extends ChangeNotifier {
  List<EventModel> previewEvents = [
    EventModel(
        image: "https://i.ytimg.com/vi/OKNlnmqGd9A/maxresdefault.jpg",
        material: [
          MaterialEventModel(
              materialCategory: "T3",
              materialImage:
                  "https://gamepress.gg/arknights/sites/arknights/files/2020-02/MTL_SL_IAM3.png",
              materialName: "Incandescent Alloy"),
          MaterialEventModel(
              materialCategory: "T3",
              materialImage:
                  "https://gamepress.gg/arknights/sites/arknights/files/2021-09/MTL_SL_CCF.png",
              materialName: "Compound Cutting Fluid"),
          MaterialEventModel(
              materialCategory: "T3",
              materialImage:
                  "https://gamepress.gg/arknights/sites/arknights/files/game-images/items/MTL_SL_G3.png",
              materialName: "Orirock Cluster"),
        ],
        name: "IL Siracusano",
        startDate: "2023-08-8",
        totalCurrency: 28,
        ytVideo: [
          YoutubeEventPreviewModel(
              thumnail: "https://i.ytimg.com/vi/cZyYO60qWbk/maxresdefault.jpg",
              youtubeUrl: "")
        ]),
    EventModel(
        image:
            "https://storage.superpixel.com/cover/e9ddca9e27e4c21a5eaf2a8befb67129.jpg@900xAUTO",
        material: [
          MaterialEventModel(
              materialCategory: "T3",
              materialImage:
                  "https://gamepress.gg/arknights/sites/arknights/files/game-images/items/MTL_SL_BOSS3.png",
              materialName: "Integrated Device"),
          MaterialEventModel(
              materialCategory: "T3",
              materialImage:
                  "https://gamepress.gg/arknights/sites/arknights/files/game-images/items/MTL_SL_IRON3.png",
              materialName: "Oriron Cluster"),
          MaterialEventModel(
              materialCategory: "T3",
              materialImage:
                  "https://gamepress.gg/arknights/sites/arknights/files/game-images/items/MTL_SL_ALCOHOL1.png",
              materialName: "Loxic Kohl"),
        ],
        name: "Zwillingstürme im Herbst",
        startDate: "2023-08-8",
        totalCurrency: 41,
        ytVideo: [
          YoutubeEventPreviewModel(
              thumnail: "https://i.ytimg.com/vi/rERuYhJP_bc/maxresdefault.jpg",
              youtubeUrl: "")
        ])
  ];

  int indexChoose = 0;

  void changeEvent(int newIndex) {
    indexChoose = newIndex;
    notifyListeners();
  }
}
