// lib/features/ai_gift_recommendation/domain/entities/gift_request_entity.dart

class GiftRequestEntity {
  final int age;
  final String profession;
  final String occasion;
  final List<String> interests;
  final double maxBudget;

  const GiftRequestEntity({
    required this.age,
    required this.profession,
    required this.occasion,
    required this.interests,
    required this.maxBudget,
  });
}