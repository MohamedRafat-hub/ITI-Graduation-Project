// lib/features/ai_gift_recommendation/data/datasources/ai_remote_data_source.dart

import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/gift_request_entity.dart';
import '../models/gift_recommendation_model.dart';

abstract class AiRemoteDataSource {
  Future<List<GiftRecommendationModel>> getGiftRecommendations(
      GiftRequestEntity request,
      );
}

@LazySingleton(as: AiRemoteDataSource)
class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final GenerativeModel _generativeModel;

  AiRemoteDataSourceImpl(this._generativeModel);

  @override
  Future<List<GiftRecommendationModel>> getGiftRecommendations(
      GiftRequestEntity request,
      ) async {
    final prompt = _buildStructuredPrompt(request);

    final response = await _generativeModel.generateContent([
      Content.text(prompt),
    ]);

    final rawText = response.text;
    if (rawText == null || rawText.isEmpty) {
      throw const FormatException('Empty response received from Gemini AI.');
    }

    return _parseJsonResponse(rawText);
  }

  String _buildStructuredPrompt(GiftRequestEntity request) {
    return '''
You are an expert AI gift-recommendation engine. Suggest exactly 3 suitable gifts based on:
- Age: ${request.age}
- Profession: ${request.profession}
- Occasion: ${request.occasion}
- Interests: ${request.interests.join(', ')}
- Maximum Budget: \$${request.maxBudget}

CRITICAL INSTRUCTIONS:
Return ONLY a valid JSON array of objects. Do NOT include markdown blocks like ```json, or any introductory text.
Each object MUST contain:
- "title": String (Short product name)
- "estimated_price": double (Under \$${request.maxBudget})
- "category": String (Category matching general e-commerce)
- "reasoning": String (1-2 sentences explaining specifically why this gift matches the recipient's inputs)
''';
  }

  List<GiftRecommendationModel> _parseJsonResponse(String rawText) {
    final cleanedText = rawText
        .replaceAll('```json', '')
        .replaceAll('```', '')
        .trim();

    final List<dynamic> jsonList = jsonDecode(cleanedText) as List<dynamic>;

    return jsonList
        .map((item) => GiftRecommendationModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}