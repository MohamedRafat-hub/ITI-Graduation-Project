import 'package:flutter/material.dart';

class GiftsHeader extends StatelessWidget {
  final String title;
  final int giftsCount;

  const GiftsHeader({
    super.key,
    required this.title,
    required this.giftsCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          16,
          16,
          10,
        ),
        child: Row(
          children: [

            // =========================
            // BACK BUTTON
            // =========================

            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFE8E1DC),
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // =========================
            // TITLE + COUNT
            // =========================

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    "$giftsCount gifts found",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // FILTER BUTTON
            // =========================

            // Container(
            //   width: 42,
            //   height: 42,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: const Color(0xFFE8E1DC),
            //     ),
            //   ),
            //   child: IconButton(
            //     padding: EdgeInsets.zero,
            //     onPressed: () {
            //       // Filter later
            //     },
            //     icon: const Icon(
            //       Icons.tune,
            //       size: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}