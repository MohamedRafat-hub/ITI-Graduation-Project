import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/model/gift_model.dart';

import '../widgets/product_details_bottom_bar.dart';
import '../widgets/product_details_info.dart';
import '../widgets/product_details_view.dart';

class ProductDetailsView extends StatefulWidget {
  final GiftModel gift;

  const ProductDetailsView({
    super.key,
    required this.gift,
  });

  @override
  State<ProductDetailsView> createState() =>
      _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;
  bool isFavorite = false;
  String selectedTab = "Description";

  double get totalPrice {
    return widget.gift.price * quantity;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void changeTab(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF8),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                ProductDetailsImage(
                  gift: widget.gift,
                  isFavorite: isFavorite,
                  onFavoriteTap: toggleFavorite,
                ),

                ProductDetailsInfo(
                  gift: widget.gift,
                  quantity: quantity,
                  totalPrice: totalPrice,
                  selectedTab: selectedTab,
                  onIncrease: increaseQuantity,
                  onDecrease: decreaseQuantity,
                  onTabChanged: changeTab,
                ),
              ],
            ),

            ProductDetailsBottomBar(
              isFavorite: isFavorite,
              totalPrice: totalPrice,
              onFavoriteTap: toggleFavorite,
              onAddToCart: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${widget.gift.name} added to cart',
                    ),
                    backgroundColor: const Color(0xFFFF654B),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}