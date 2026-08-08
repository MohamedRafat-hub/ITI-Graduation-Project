import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/model/gift_model.dart';

import 'product_quantity.dart';
import 'product_details_tabs.dart';
import 'why_this_gift.dart';

class ProductDetailsInfo extends StatelessWidget {
  final GiftModel gift;
  final int quantity;
  final double totalPrice;
  final String selectedTab;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final ValueChanged<String> onTabChanged;

  const ProductDetailsInfo({
    super.key,
    required this.gift,
    required this.quantity,
    required this.totalPrice,
    required this.selectedTab,
    required this.onIncrease,
    required this.onDecrease,
    required this.onTabChanged,
  });

  static const Color orangeColor = Color(0xFFFF654B);
  static const Color darkBrown = Color(0xFF35170B);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "\$${gift.price.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: orangeColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              gift.name,
              style: const TextStyle(
                color: darkBrown,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 20),

            ProductQuantity(
              quantity: quantity,
              totalPrice: totalPrice,
              onIncrease: onIncrease,
              onDecrease: onDecrease,
            ),

            const SizedBox(height: 18),

            ProductDetailsTabs(
              gift: gift,
              selectedTab: selectedTab,
              onTabChanged: onTabChanged,
            ),

            const SizedBox(height: 24),

            const WhyThisGift(),
          ],
        ),
      ),
    );
  }
}