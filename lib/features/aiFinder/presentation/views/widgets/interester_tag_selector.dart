// lib/features/ai_gift_recommendation/presentation/widgets/inputs/interests_tag_selector.dart

import 'package:flutter/material.dart';

class InterestsTagSelector extends StatelessWidget {
  final List<String> selectedInterests;
  final List<String> availableInterests;
  final Function(String interest, bool isSelected) onToggleInterest;

  const InterestsTagSelector({
    super.key,
    required this.selectedInterests,
    required this.availableInterests,
    required this.onToggleInterest,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interests / Hobbies',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: availableInterests.map((interest) {
            final isSelected = selectedInterests.contains(interest);
            return FilterChip(
              label: Text(interest),
              selected: isSelected,
              onSelected: (selected) => onToggleInterest(interest, selected),
            );
          }).toList(),
        ),
      ],
    );
  }
}