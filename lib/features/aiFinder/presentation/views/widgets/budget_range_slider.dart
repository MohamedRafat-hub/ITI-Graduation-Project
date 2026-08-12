// lib/features/ai_gift_recommendation/presentation/widgets/inputs/budget_range_slider.dart

import 'package:flutter/material.dart';

class BudgetRangeSlider extends StatelessWidget {
  final double maxBudget;
  final ValueChanged<double> onChanged;

  const BudgetRangeSlider({
    super.key,
    required this.maxBudget,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Max Budget: \$${maxBudget.round()}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: maxBudget,
          min: 10,
          max: 500,
          divisions: 49,
          activeColor: Colors.green,
          label: '\$${maxBudget.round()}',
          onChanged: onChanged,
        ),
      ],
    );
  }
}