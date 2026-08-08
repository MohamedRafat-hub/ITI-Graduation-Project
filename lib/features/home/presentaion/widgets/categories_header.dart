import 'package:flutter/material.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFE8E1DC),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Gift Categories",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF35170B),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Browse gifts by occasion or recipient",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9B7563),
              ),
            ),

            const SizedBox(height: 20),

            // Search
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE8DDD7),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xFF9B7563),
                    size: 22,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Search categories...",
                    style: TextStyle(
                      color: Color(0xFF9B7563),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}