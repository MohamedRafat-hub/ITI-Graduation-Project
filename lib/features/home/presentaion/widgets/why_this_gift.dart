import 'package:flutter/material.dart';

class WhyThisGift extends StatelessWidget {
  const WhyThisGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF35170B),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: Color(0xFFFF654B),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.card_giftcard,
              color: Colors.white,
              size: 20,
            ),
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WHY THIS GIFT?",
                  style: TextStyle(
                    color: Color(0xFFFF654B),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "A thoughtful gift selected for your occasion.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}