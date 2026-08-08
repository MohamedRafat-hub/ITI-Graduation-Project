import 'package:flutter/material.dart';

import '../../data/model/gift_model.dart';
import '../views/product_details_view.dart';
import 'product_card.dart';

class GiftsGrid extends StatelessWidget {
  final List<GiftModel> gifts;

  const GiftsGrid({
    super.key,
    required this.gifts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        16,
        8,
        16,
        24,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final gift = gifts[index];

            return ProductCard(
              image: gift.imageUrl,
              name: gift.name,
              price: gift.price,
              rating: gift.rating,
              oldPrice: gift.oldPrice,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsView(
                      gift: gift,
                    ),
                  ),
                );
              },
            );
          },
          childCount: gifts.length,
        ),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 22,
          childAspectRatio: 0.68,
        ),
      ),
    );
  }
}