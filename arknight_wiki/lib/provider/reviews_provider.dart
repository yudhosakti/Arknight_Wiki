import 'package:arknight_wiki/models/reviews_model.dart';
import 'package:flutter/material.dart';

class ReviewsProvider extends ChangeNotifier {
  List<ReviewsModel> reviewsDummy = [
    ReviewsModel(
        image: "https://arknights.wiki.gg/images/a/a9/Logos_icon.png",
        isExpanded: false,
        message:
            "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
        name: "Elite Operator Logos",
        rating: 4.6),
    ReviewsModel(
        image: "https://arknights.wiki.gg/images/a/a9/Logos_icon.png",
        isExpanded: false,
        message:
            "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
        name: "Elite Operator Logos",
        rating: 4.4),
    ReviewsModel(
        image: "https://arknights.wiki.gg/images/a/a9/Logos_icon.png",
        isExpanded: false,
        message:
            "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
        name: "Elite Operator Logos",
        rating: 4.3),
    ReviewsModel(
        image: "https://arknights.wiki.gg/images/a/a9/Logos_icon.png",
        isExpanded: false,
        message:
            "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
        name: "Elite Operator Logos",
        rating: 4.2),
    ReviewsModel(
        image: "https://arknights.wiki.gg/images/a/a9/Logos_icon.png",
        isExpanded: false,
        message:
            "Logos is a unique Sarkaz caster. Not only is he a male Banshee, a rare sight within the sub-race, but he was also appointed to be the successor of the Banshee Lord at a young age. His Originium Arts is oral-type, allowing him to cast it by simply speaking or writing with his bone pen.[1][2] This makes him the most powerful Operator among Rhodes Island's Elite Operators.",
        name: "Elite Operator Logos",
        rating: 4.1),
  ];

  void changeExpand(int index) {
    reviewsDummy[index].isExpanded = !reviewsDummy[index].isExpanded;
    notifyListeners();
  }
}
