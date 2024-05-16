import 'package:arknight_wiki/models/gacha_banner_model.dart';

class OperatorClassBannerModel {
  final String nameClass;
  final String imageClass;
  final String descriptionClass;
  final List<RateUpModel> operators;

  OperatorClassBannerModel(
      {required this.descriptionClass,
      required this.imageClass,
      required this.nameClass,
      required this.operators});
}
