// lib/features/ai_gift_recommendation/domain/repositories/ai_recommendation_repository.dart

import '../entities/gift_recommendation_entity.dart';
import '../entities/gift_request_entity.dart';

abstract class AiRecommendationRepository {
  Future<List<GiftRecommendationEntity>> getGiftRecommendations(
      GiftRequestEntity request,
      );
}