// lib/features/ai_gift_recommendation/presentation/cubit/ai_recommendation_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/gift_request_entity.dart';
import '../../../domain/usecases/get_gift_recommendation_use_case.dart';
import 'ai_recommendation_state.dart';

@injectable
class AiRecommendationCubit extends Cubit<AiRecommendationState> {
  final GetGiftRecommendationsUseCase _getGiftRecommendationsUseCase;

  AiRecommendationCubit(this._getGiftRecommendationsUseCase)
      : super(AiRecommendationInitial());

  Future<void> fetchRecommendations(GiftRequestEntity request) async {
    emit(AiRecommendationLoading());

    try {
      final results = await _getGiftRecommendationsUseCase(request);
      emit(AiRecommendationSuccess(results));
    } catch (e) {
      emit(AiRecommendationError(e.toString()));
    }
  }
}