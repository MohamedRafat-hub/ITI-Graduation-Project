class GiftModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double oldPrice;
  final int discount;
  final double rating;
  final int reviews;
  final String category;

  GiftModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.category,
  });

  factory GiftModel.fromJson(
      Map<String, dynamic> json,
      String id,
      ) {
    return GiftModel(
      id: id,
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: (json['oldPrice'] ?? 0).toDouble(),
      discount: json['discount'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      reviews: json['reviews'] ?? 0,
      category: json['category'] ?? '',
    );
  }
}