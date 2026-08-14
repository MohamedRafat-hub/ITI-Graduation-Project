import 'package:injectable/injectable.dart';

import 'package:graduation_project/features/aiFinder/domain/entities/gift_recommendation_entity.dart';

import '../entities/catalog_match_entity.dart';
import '../repositories/catalog_matcher_repository.dart';

@injectable
class MatchGiftRecommendationsUseCase {
  final CatalogMatcherRepository repository;

  const MatchGiftRecommendationsUseCase(this.repository);

  Future<List<CatalogMatchEntity>> call(
      List<GiftRecommendationEntity> recommendations,
      ) {
    return repository.matchRecommendations(recommendations);
  }
}