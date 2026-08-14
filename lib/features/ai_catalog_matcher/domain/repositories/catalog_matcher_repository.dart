import 'package:graduation_project/features/aiFinder/domain/entities/gift_recommendation_entity.dart';
import '../entities/catalog_match_entity.dart';

abstract class CatalogMatcherRepository {
  Future<List<CatalogMatchEntity>> matchRecommendations(
      List<GiftRecommendationEntity> recommendations,
      );
}