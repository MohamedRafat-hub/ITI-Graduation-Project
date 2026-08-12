// lib/features/ai_gift_recommendation/presentation/widgets/inputs/profession_dropdown_field.dart

import 'package:flutter/material.dart';

class ProfessionDropdownField extends StatelessWidget {
  final String selectedProfession;
  final List<String> professions;
  final ValueChanged<String?> onChanged;

  const ProfessionDropdownField({
    super.key,
    required this.selectedProfession,
    required this.professions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profession / Role',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedProfession,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: professions
              .map((p) => DropdownMenuItem(value: p, child: Text(p)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}