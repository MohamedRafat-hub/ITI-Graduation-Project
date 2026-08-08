abstract class ShoppingState {}

class ShoppingInitial extends ShoppingState {}

class ShoppingUpdated extends ShoppingState {
  final List<Map<String, dynamic>> cartItems;
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;

  ShoppingUpdated({
    required this.cartItems,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });
}