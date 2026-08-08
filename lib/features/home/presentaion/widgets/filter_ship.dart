import 'package:flutter/material.dart';

class FilterShip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const FilterShip({
    super.key,
    required this.title,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFF654B)
              : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected
                ? const Color(0xFFFF654B)
                : const Color(0xFFE8E1DC),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected
                  ? Colors.white
                  : const Color(0xFF55504C),
            ),
          ),
        ),
      ),
    );
  }
}