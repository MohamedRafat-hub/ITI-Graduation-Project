import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:graduation_project/features/aiFinder/domain/entities/gift_recommendation_entity.dart';

import '../../domain/usecases/match_gift_recommendations_usecase.dart';
import 'catalog_matcher_state.dart';

@injectable
class CatalogMatcherCubit extends Cubit<CatalogMatcherState> {
  final MatchGiftRecommendationsUseCase _matchGiftRecommendationsUseCase;

  CatalogMatcherCubit(this._matchGiftRecommendationsUseCase)
      : super(CatalogMatcherInitial());

  Future<void> matchRecommendations(
      List<GiftRecommendationEntity> recommendations,
      ) async {
    emit(CatalogMatcherLoading());

    try {
      final matches =
      await _matchGiftRecommendationsUseCase(recommendations);

      emit(CatalogMatcherSuccess(matches));
    } catch (e) {
      emit(CatalogMatcherError(e.toString()));
    }
  }
}