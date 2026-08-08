import 'package:flutter/material.dart';

class ProductQuantity extends StatelessWidget {
  final int quantity;
  final double totalPrice;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductQuantity({
    super.key,
    required this.quantity,
    required this.totalPrice,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7EEE8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Text(
            "Quantity",
            style: TextStyle(
              color: Color(0xFF8A5038),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          _QuantityButton(
            icon: Icons.remove,
            enabled: quantity > 1,
            onTap: onDecrease,
          ),

          SizedBox(
            width: 45,
            child: Center(
              child: Text(
                "$quantity",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          _QuantityButton(
            icon: Icons.add,
            isAdd: true,
            onTap: onIncrease,
          ),

          const Spacer(),

          Text(
            "\$${totalPrice.toStringAsFixed(0)}",
            style: const TextStyle(
              color: Color(0xFFFF654B),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;
  final bool isAdd;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.enabled = true,
    this.isAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isAdd
              ? const Color(0xFFFF654B)
              : const Color(0xFFEDE0D8),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: isAdd
              ? Colors.white
              : const Color(0xFFBBA89D),
        ),
      ),
    );
  }
}