// lib/features/ai_gift_recommendation/presentation/cubit/ai_recommendation_state.dart

import 'package:equatable/equatable.dart';
import '../../../domain/entities/gift_recommendation_entity.dart';

abstract class AiRecommendationState extends Equatable {
  const AiRecommendationState();

  @override
  List<Object?> get props => [];
}

class AiRecommendationInitial extends AiRecommendationState {}

class AiRecommendationLoading extends AiRecommendationState {}

class AiRecommendationSuccess extends AiRecommendationState {
  final List<GiftRecommendationEntity> recommendations;

  const AiRecommendationSuccess(this.recommendations);

  @override
  List<Object?> get props => [recommendations];
}

class AiRecommendationError extends AiRecommendationState {
  final String message;

  const AiRecommendationError(this.message);

  @override
  List<Object?> get props => [message];
}