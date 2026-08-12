// lib/features/ai_gift_recommendation/data/repositories/ai_recommendation_repository_impl.dart

import 'package:injectable/injectable.dart';
import '../../domain/entities/gift_recommendation_entity.dart';
import '../../domain/entities/gift_request_entity.dart';
import '../../domain/repos/ai_recommendation_repo.dart';
import '../data_sources/ai_remote_data_source.dart';

@LazySingleton(as: AiRecommendationRepository)
class AiRecommendationRepositoryImpl implements AiRecommendationRepository {
  final AiRemoteDataSource _remoteDataSource;

  AiRecommendationRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<GiftRecommendationEntity>> getGiftRecommendations(
      GiftRequestEntity request,
      ) async {
    try {
      final models = await _remoteDataSource.getGiftRecommendations(request);
      return models;
    } catch (error) {
      throw Exception('Failed to fetch gift recommendations: ${error.toString()}');
    }
  }
}