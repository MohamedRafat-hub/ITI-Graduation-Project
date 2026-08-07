import 'package:flutter_bloc/flutter_bloc.dart';
import 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingInitial()) {

    _emitUpdate();
  }

  final List<Map<String, dynamic>> _cartItems = [
    {
      'id': '1',
      'title': 'Artisan Ceramic Vase',
      'price': 24.00,
      'image': 'https://images.unsplash.com/photo-1612196808214-b8e1e6145a3c?w=400',
      'quantity': 2,
    },
    {
      'id': '2',
      'title': 'Smart Linen Journal',
      'price': 45.00,
      'image': 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
      'quantity': 1,
    },
  ];

  final double _shipping = 5.99;
  final double _tax = 7.44;

  void _emitUpdate() {
    double subtotal = _cartItems.fold(
      0,
          (sum, item) => sum + (item['price'] * item['quantity']),
    );
    double total = subtotal > 0 ? subtotal + _shipping + _tax : 0;

    emit(ShoppingUpdated(
      cartItems: List.from(_cartItems),
      subtotal: subtotal,
      shipping: _shipping,
      tax: _tax,
      total: total,
    ));
  }

  void incrementQuantity(int index) {
    _cartItems[index]['quantity']++;
    _emitUpdate();
  }

  void decrementQuantity(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
      _emitUpdate();
    }
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    _emitUpdate();
  }

  void addItem(Map<String, dynamic> product) {

    int existingIndex = _cartItems.indexWhere((item) => item['id'] == product['id']);
    if (existingIndex != -1) {
      _cartItems[existingIndex]['quantity']++;
    } else {
      _cartItems.add({
        'id': product['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
        'title': product['title'],
        'price': product['price'],
        'image': product['image'],
        'quantity': 1,
      });
    }
    _emitUpdate();
  }
}