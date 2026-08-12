// lib/features/ai_gift_recommendation/presentation/widgets/inputs/occasion_chip_selector.dart

import 'package:flutter/material.dart';

class OccasionChipSelector extends StatelessWidget {
  final String selectedOccasion;
  final List<String> occasions;
  final ValueChanged<String> onSelected;

  const OccasionChipSelector({
    super.key,
    required this.selectedOccasion,
    required this.occasions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Occasion',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: occasions.map((occ) {
            final isSelected = selectedOccasion == occ;
            return ChoiceChip(
              label: Text(occ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) onSelected(occ);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}