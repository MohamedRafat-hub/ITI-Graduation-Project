// lib/features/ai_gift_recommendation/presentation/widgets/inputs/age_selector_slider.dart

import 'package:flutter/material.dart';

class AgeSelectorSlider extends StatelessWidget {
  final double age;
  final ValueChanged<double> onChanged;

  const AgeSelectorSlider({
    super.key,
    required this.age,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipient Age: ${age.round()} years old',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: age,
          min: 1,
          max: 90,
          divisions: 89,
          label: age.round().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}