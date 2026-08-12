// lib/features/ai_gift_recommendation/presentation/pages/gift_recommentation_result_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/recommendation_card.dart';
import '../../domain/entities/gift_request_entity.dart';
import '../cubits/ai_recommendation_cubit/ai_recommendation_cubit.dart';
import '../cubits/ai_recommendation_cubit/ai_recommendation_state.dart';


class GiftRecommendationResultsPage extends StatelessWidget {
  final GiftRequestEntity request;

  const GiftRecommendationResultsPage({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Gift Recommendations ✨'),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
      body: BlocBuilder<AiRecommendationCubit, AiRecommendationState>(
        builder: (context, state) {
          // 1. Loading State
          if (state is AiRecommendationLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    'Thinking of the perfect gift...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Analyzing preferences with Gemini AI 🤖',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          // 2. Error State
          if (state is AiRecommendationError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 64,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Oops! Something went wrong',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<AiRecommendationCubit>()
                            .fetchRecommendations(request);
                      },
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: const Text(
                        'Try Again',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // 3. Success State
          if (state is AiRecommendationSuccess) {
            final recommendations = state.recommendations;

            if (recommendations.isEmpty) {
              return const Center(
                child: Text('No recommendations found. Try adjusting your inputs!'),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final recommendation = recommendations[index];
                return RecommendationCard(
                  recommendation: recommendation,
                  onAddToCart: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${recommendation.title} added to cart!'),
                      ),
                    );
                  },
                  onAddToWishlist: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${recommendation.title} added to wishlist!'),
                      ),
                    );
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}