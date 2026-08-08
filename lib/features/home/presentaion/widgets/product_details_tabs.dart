import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/model/gift_model.dart';

class ProductDetailsTabs extends StatelessWidget {
  final GiftModel gift;
  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  const ProductDetailsTabs({
    super.key,
    required this.gift,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFF7EEE8),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              _TabButton(
                title: "Description",
                selected: selectedTab == "Description",
                onTap: () => onTabChanged("Description"),
              ),
              _TabButton(
                title: "Details",
                selected: selectedTab == "Details",
                onTap: () => onTabChanged("Details"),
              ),
              _TabButton(
                title: "Reviews",
                selected: selectedTab == "Reviews",
                onTap: () => onTabChanged("Reviews"),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        _TabContent(
          gift: gift,
          selectedTab: selectedTab,
        ),
      ],
    );
  }
}

class _TabContent extends StatelessWidget {
  final GiftModel gift;
  final String selectedTab;

  const _TabContent({
    required this.gift,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case "Details":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              gift.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );

      case "Reviews":
        return Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFFFB11B),
              size: 22,
            ),
            const SizedBox(width: 8),
            Text(
              "${gift.rating.toStringAsFixed(1)} / 5.0",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );

      default:
        return Text(
          "Discover ${gift.name}, a thoughtful gift choice.",
          style: const TextStyle(
            color: Color(0xFF8A5038),
            fontSize: 14,
            height: 1.8,
          ),
        );
    }
  }
}

class _TabButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected
                ? Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: selected
                  ? FontWeight.bold
                  : FontWeight.w600,
              color: selected
                  ? Colors.black87
                  : const Color(0xFF9C8376),
            ),
          ),
        ),
      ),
    );
  }
}