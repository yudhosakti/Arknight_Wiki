class EventModel {
  final String name;
  final String startDate;
  final int totalCurrency;
  final String image;
  final List<MaterialEventModel> material;
  final List<YoutubeEventPreviewModel> ytVideo;

  EventModel(
      {required this.image,
      required this.material,
      required this.name,
      required this.startDate,
      required this.totalCurrency,
      required this.ytVideo});
}

class MaterialEventModel {
  final String materialName;
  final String materialImage;
  final String materialCategory;

  MaterialEventModel(
      {required this.materialCategory,
      required this.materialImage,
      required this.materialName});
}

class YoutubeEventPreviewModel {
  final String youtubeUrl;
  final String thumnail;

  YoutubeEventPreviewModel({required this.thumnail, required this.youtubeUrl});
}
