import 'package:flutter/material.dart';

IconData getCategoryIcon(String iconName) {
  switch (iconName) {
    case 'cake':
      return Icons.cake;
    case 'school':
      return Icons.school;
    case 'favorite':
      return Icons.favorite;
    case 'card_giftcard':
      return Icons.card_giftcard;
    default:
      return Icons.category;
  }
}