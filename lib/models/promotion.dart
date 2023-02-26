class PromotionModel {
  final String title;
  final String description;
  final int discount;
  final String image;
  final String? id;
  final String? name;
  final String? imageUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? validity;
  final String? location;
  final int? price;

  PromotionModel({
    required this.title,
    required this.description,
    required this.discount,
    required this.image,
    this.id,
    this.name,
    this.imageUrl,
    this.startDate,
    this.endDate,
    this.validity,
    this.location,
    this.price,
  });
}
