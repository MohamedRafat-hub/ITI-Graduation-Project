import 'package:injectable/injectable.dart';

import 'package:graduation_project/features/aiFinder/domain/entities/gift_recommendation_entity.dart';
import 'package:graduation_project/features/search/data/models/product_model.dart';

import '../../domain/entities/catalog_match_entity.dart';
import '../../domain/repositories/catalog_matcher_repository.dart';
import '../datasources/catalog_products_remote_data_source.dart';

@LazySingleton(as: CatalogMatcherRepository)
class CatalogMatcherRepositoryImpl implements CatalogMatcherRepository {
  final CatalogProductsRemoteDataSource remoteDataSource;

  CatalogMatcherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<CatalogMatchEntity>> matchRecommendations(
      List<GiftRecommendationEntity> recommendations,
      ) async {
    final products = await remoteDataSource.getAllProducts();

    final Map<String, CatalogMatchEntity> uniqueMatches = {};

    for (final recommendation in recommendations) {
      for (final product in products) {
        final score = _calculateMatchScore(
          recommendation,
          product,
        );

        if (score <= 0) {
          continue;
        }

        final existingMatch = uniqueMatches[product.id];

        if (existingMatch == null ||
            score > existingMatch.matchScore) {
          uniqueMatches[product.id] = CatalogMatchEntity(
            product: product,
            matchScore: score,
          );
        }
      }
    }

    final matches = uniqueMatches.values.toList();

    matches.sort(
          (a, b) => b.matchScore.compareTo(a.matchScore),
    );

    return matches;
  }

  double _calculateMatchScore(
      GiftRecommendationEntity recommendation,
      ProductModel product,
      ) {
    double score = 0.0;

    // Category match
    if (recommendation.category.trim().toLowerCase() ==
        product.category.trim().toLowerCase()) {
      score += 0.5;
    }

    // Price match
    if (recommendation.estimatedPrice > 0 &&
        product.price <= recommendation.estimatedPrice) {
      score += 0.3;
    }

    // Title similarity
    final recommendationWords =
    recommendation.title.toLowerCase().split(' ');

    final productTitle = product.title.toLowerCase();

    final hasMatchingWord = recommendationWords.any(
          (word) =>
      word.length > 2 &&
          productTitle.contains(word),
    );

    if (hasMatchingWord) {
      score += 0.2;
    }

    return score;
  }
}