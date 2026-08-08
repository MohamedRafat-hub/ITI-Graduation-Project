import 'package:flutter/material.dart';

IconData getCategoryIcon(String icon) {
  switch (icon) {
    case '🎂':
      return Icons.cake;
    case '🎓':
      return Icons.school;
    case '💍':
      return Icons.favorite;
    case '🎁':
      return Icons.card_giftcard;
    case '🥂':
      return Icons.celebration;
    case '❤️':
      return Icons.favorite;
    case '👔':
      return Icons.man;
    case '🌸':
      return Icons.local_florist;
    default:
      return Icons.category;
  }
}