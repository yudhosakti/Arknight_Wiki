class GachaBannerModel {
  final String title;
  final String image;
  final String date;
  final List<RateUpModel> rateup;

  GachaBannerModel(
      {required this.date,
      required this.image,
      required this.rateup,
      required this.title});
}

class RateUpModel {
  final String name;
  final String image;

  RateUpModel({required this.image, required this.name});
}
