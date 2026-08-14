import 'package:graduation_project/features/search/data/models/product_model.dart';

class CatalogMatchEntity {
  final ProductModel product;
  final double matchScore;

  const CatalogMatchEntity({
    required this.product,
    required this.matchScore,
  });
}