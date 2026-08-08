import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/model/gift_model.dart';

class ProductDetailsImage extends StatelessWidget {
  final GiftModel gift;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProductDetailsImage({
    super.key,
    required this.gift,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  static const Color orangeColor = Color(0xFFFF654B);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SizedBox(
            height: 380,
            width: double.infinity,
            child: Image.network(
              gift.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (
                  context,
                  error,
                  stackTrace,
                  ) {
                return Container(
                  color: const Color(0xFFE5E8EA),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          // Gradient
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 100,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.18),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Back
          Positioned(
            top: 16,
            left: 16,
            child: _CircleButton(
              icon: Icons.arrow_back_ios_new,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Favorite
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: orangeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),

          // Rating
          Positioned(
            right: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xFFFFB11B),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    gift.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: Colors.black87,
        ),
      ),
    );
  }
}