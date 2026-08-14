class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String thumbnail;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.category,
  });

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     id: json['id'].toString(),
  //     title: json['name'] ?? json['title'] ?? '',
  //     description: json['description'] ?? '',
  //     price: (json['price'] as num?)?.toDouble() ?? 0.0,
  //     rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  //     thumbnail: json['img'] ?? json['thumbnail'] ?? '',
  //     category: json['categoryId'] ?? json['category'] ?? '',
  //   );
  // }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['name'] ?? json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      thumbnail: json['imageUrl'] ?? json['img'] ?? json['thumbnail'] ?? '',
      category: json['category'] ?? json['categoryId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'rating': rating,
      'thumbnail': thumbnail,
      'category': category,
    };
  }
}