class ReviewsModel {
  final String name;
  final String image;
  final dynamic rating;
  final String message;
  bool isExpanded;

  ReviewsModel(
      {required this.image,
      required this.isExpanded,
      required this.message,
      required this.name,
      required this.rating});
}
