// lib/features/ai_gift_recommendation/domain/usecases/get_gift_recommendations_usecase.dart

import 'package:injectable/injectable.dart';
import '../entities/gift_recommendation_entity.dart';
import '../entities/gift_request_entity.dart';
import '../repos/ai_recommendation_repo.dart';

@injectable
class GetGiftRecommendationsUseCase {
  final AiRecommendationRepository _repository;

  GetGiftRecommendationsUseCase(this._repository);

  Future<List<GiftRecommendationEntity>> call(GiftRequestEntity request) {
    return _repository.getGiftRecommendations(request);
  }
}