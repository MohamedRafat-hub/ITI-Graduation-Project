import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/core/theme/color_manager.dart';

import 'package:graduation_project/features/ai_catalog_matcher/presentation/cubit/catalog_matcher_cubit.dart';
import 'package:graduation_project/features/ai_catalog_matcher/presentation/cubit/catalog_matcher_state.dart';

// import 'package:graduation_project/features/aiFinder/data/models/gift_recommendation_model.dart';

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
return BlocProvider(
create: (_) => getIt<CatalogMatcherCubit>(),
child: Scaffold(
appBar: AppBar(
title: const Text('AI Gift Recommendations ✨'),
centerTitle: true,
backgroundColor: ColorManager.primary,
),
body: BlocListener<AiRecommendationCubit, AiRecommendationState>(
listener: (context, state) {
// if (state is AiRecommendationSuccess &&
// state.recommendations.isNotEmpty) {
// final recommendations = state.recommendations
//     .map(
// (recommendation) => GiftRecommendationModel(
// title: recommendation.title,
// estimatedPrice: recommendation.estimatedPrice,
// category: recommendation.category,
// reasoning: recommendation.reasoning,
// ),
// )
//     .toList();
//
// context
//     .read<CatalogMatcherCubit>()
//     .matchRecommendations(recommendations);
// }
  if (state is AiRecommendationSuccess &&
      state.recommendations.isNotEmpty) {
    context
        .read<CatalogMatcherCubit>()
        .matchRecommendations(state.recommendations);
  }
},
child: BlocBuilder<AiRecommendationCubit, AiRecommendationState>(
builder: (context, aiState) {
// =========================
// AI LOADING
// =========================
if (aiState is AiRecommendationLoading) {
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

// =========================
// AI ERROR
// =========================
if (aiState is AiRecommendationError) {
return Center(
child: Padding(
padding: const EdgeInsets.all(24),
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
style: Theme.of(context)
    .textTheme
    .titleMedium
    ?.copyWith(
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
Text(
aiState.message,
textAlign: TextAlign.center,
style: const TextStyle(
color: Colors.grey,
fontSize: 14,
),
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
icon: const Icon(
Icons.refresh,
color: Colors.white,
),
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

// =========================
// AI SUCCESS
// =========================
if (aiState is AiRecommendationSuccess) {
final recommendations = aiState.recommendations;

if (recommendations.isEmpty) {
return const Center(
child: Text(
'No recommendations found. '
'Try adjusting your inputs!',
),
);
}

// =========================
// CATALOG MATCHER
// =========================
return BlocBuilder<CatalogMatcherCubit,
CatalogMatcherState>(
builder: (context, matcherState) {
// Matcher Loading
if (matcherState is CatalogMatcherLoading) {
return const Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
CircularProgressIndicator(),
SizedBox(height: 16),
Text(
'Finding the best products for you...',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
],
),
);
}

// Matcher Error
if (matcherState is CatalogMatcherError) {
return Center(
child: Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(
Icons.search_off,
size: 60,
color: Colors.redAccent,
),
const SizedBox(height: 16),
const Text(
'Could not find matching products',
style: TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
Text(
matcherState.message,
textAlign: TextAlign.center,
style: const TextStyle(
color: Colors.grey,
),
),
],
),
),
);
}

// Matcher Success
if (matcherState is CatalogMatcherSuccess) {
final matches = matcherState.matches;

if (matches.isEmpty) {
return const Center(
child: Text(
'No matching products found in the catalog.',
),
);
}

return ListView.builder(
padding: const EdgeInsets.symmetric(
vertical: 16,
horizontal: 16,
),
itemCount: matches.length,
itemBuilder: (context, index) {
final match = matches[index];
final product = match.product;

return Card(
margin: const EdgeInsets.only(bottom: 16),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
child: Padding(
padding: const EdgeInsets.all(12),
child: Row(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
// Product Image
ClipRRect(
borderRadius:
BorderRadius.circular(12),
child: SizedBox(
width: 100,
height: 100,
child: product.thumbnail.isNotEmpty
? Image.network(
product.thumbnail,
fit: BoxFit.cover,
errorBuilder:
(_, __, ___) {
return const Icon(
Icons.image_not_supported,
size: 40,
);
},
)
    : const Icon(
Icons.image_not_supported,
size: 40,
),
),
),

const SizedBox(width: 12),

// Product Information
Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(
product.title,
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 6),

Text(
product.category,
style: const TextStyle(
color: Colors.grey,
),
),

const SizedBox(height: 6),

Text(
'\$${product.price.toStringAsFixed(2)}',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color:
ColorManager.primary,
),
),

const SizedBox(height: 6),

Text(
'Match: ${(match.matchScore * 100).toStringAsFixed(0)}%',
style: const TextStyle(
fontSize: 13,
fontWeight: FontWeight.w600,
),
),
],
),
),
],
),
),
);
},
);
}

// Initial state
return const SizedBox.shrink();
},
);
}

return const SizedBox.shrink();
},
),
),
),
);
}
}

