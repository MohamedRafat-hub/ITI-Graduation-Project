import 'package:flutter/material.dart';
import 'package:graduation_project/features/search/views/checkout_view.dart';



import 'package:graduation_project/features/search/presentation/cubit/shopping_cubit.dart';
import 'package:graduation_project/features/search/presentation/cubit/shopping_state.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingCubit(),
      child: const ShoppingScreenBody(),
    );
  }
}

class ShoppingScreenBody extends StatelessWidget {
  const ShoppingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFE8614A);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Shopping Screen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ShoppingCubit, ShoppingState>(
        builder: (context, state) {
          if (state is ShoppingUpdated) {
            if (state.cartItems.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }

            int totalItemsCount = state.cartItems.fold<int>(0, (sum, item) => sum + (item['quantity']as int));

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item['image'],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item['title'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete_outline,
                                            size: 18, color: Colors.grey),
                                        onPressed: () {
                                          context.read<ShoppingCubit>().removeItem(index);
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${(item['price'] as double).toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove, size: 14),
                                              onPressed: () {
                                                context.read<ShoppingCubit>().decrementQuantity(index);
                                              },
                                            ),
                                            Text('${item['quantity']}',
                                                style: const TextStyle(fontWeight: FontWeight.bold)),
                                            IconButton(
                                              icon: const Icon(Icons.add, size: 14),
                                              onPressed: () {
                                                context.read<ShoppingCubit>().incrementQuantity(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Order Summary Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal ($totalItemsCount items)',
                              style: const TextStyle(color: Colors.grey)),
                          Text('\$${state.subtotal.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Estimated Shipping',
                              style: TextStyle(color: Colors.grey)),
                          Text('\$${state.shipping.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Tax', style: TextStyle(color: Colors.grey)),
                          Text('\$${state.tax.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                            '\$${state.total.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CheckoutView()),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_outline, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Proceed to Checkout',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}







