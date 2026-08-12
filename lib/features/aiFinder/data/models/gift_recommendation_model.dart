// lib/features/ai_gift_recommendation/data/models/gift_recommendation_model.dart

import '../../domain/entities/gift_recommendation_entity.dart';

class GiftRecommendationModel extends GiftRecommendationEntity {
  const GiftRecommendationModel({
    required super.title,
    required super.estimatedPrice,
    required super.category,
    required super.reasoning,
  });

  /// Creates a model instance safely from a raw JSON map.
  factory GiftRecommendationModel.fromJson(Map<String, dynamic> json) {
    return GiftRecommendationModel(
      title: json['title'] as String? ?? 'Unknown Gift',
      estimatedPrice: (json['estimated_price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] as String? ?? 'General',
      reasoning: json['reasoning'] as String? ?? 'No reasoning provided.',
    );
  }

  /// Converts the model back into a JSON map for persistence or debugging.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'estimated_price': estimatedPrice,
      'category': category,
      'reasoning': reasoning,
    };
  }
}