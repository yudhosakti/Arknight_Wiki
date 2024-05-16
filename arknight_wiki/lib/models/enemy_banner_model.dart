import 'package:arknight_wiki/models/gacha_banner_model.dart';

class EnemyBannerModel {
  final String category;
  final String description;
  final List<RateUpModel> enemies;

  EnemyBannerModel(
      {required this.category,
      required this.description,
      required this.enemies});
}
