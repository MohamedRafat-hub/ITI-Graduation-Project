import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/core/theme/style_manager.dart';
import 'package:graduation_project/core/theme/values_manager.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final double? oldPrice;
  final double rating;
  bool isFavorite = false;
  final VoidCallback? onTap;

  ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.rating,
// this.isFavorite = false,
    this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: AppSize.s180,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppRadius.r18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: AppSize.s10,
              offset: const Offset(
                AppSize.s0,
                AppSize.s4,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            Stack(
              children: [
        ClipRRect(
        borderRadius: const BorderRadius.vertical(
        top: Radius.circular(AppRadius.r18),
      ),
      child: Hero(
        tag: '${widget.name}_${widget.image}', // 👈 حل المشكلة: دمج الاسم مع الصورة يضمن Unique Tag
        child: Image.network(
          widget.image,
          height: AppSize.s140,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: AppSize.s170,
              color: ColorManager.grey100,
              child: const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: ColorManager.grey500,
                ),
              ),
            );
          },
        ),
      ),
    ),

                /// Favorite Button
                Positioned(
                  top: AppPadding.p10,
                  right: AppPadding.p10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      width: AppSize.s36,
                      height: AppSize.s36,
                      decoration: const BoxDecoration(
                        color: ColorManager.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? ColorManager.primary
                            : ColorManager.grey500,
                        size: AppSize.s20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleSmall,
                  ),
                  const SizedBox(height: AppSize.s8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: AppSize.s16,
                      ),
                      const SizedBox(width: AppSize.s4),
                      Text(
                        widget.rating.toStringAsFixed(1),
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s10),
                  Row(
                    children: [
                      Text(
                        '\$${widget.price.toStringAsFixed(0)}',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(width: AppSize.s8),
                      if (widget.oldPrice != null)
                        Text(
                          '\$${widget.oldPrice!.toStringAsFixed(0)}',
                          style: AppTextStyles.bodySmall.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: ColorManager.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
