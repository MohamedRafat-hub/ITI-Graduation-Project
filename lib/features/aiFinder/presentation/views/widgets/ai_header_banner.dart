// lib/features/ai_gift_recommendation/presentation/widgets/ai_header_banner.dart

import 'package:flutter/material.dart';

class AiHeaderBanner extends StatelessWidget {
  const AiHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor.withOpacity(0.15), Colors.amber.withOpacity(0.15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: const Row(
        children: [
          Icon(Icons.auto_awesome, color: Colors.amber, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Tell Gemini who you are buying for, and let AI pick the perfect gift!',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}