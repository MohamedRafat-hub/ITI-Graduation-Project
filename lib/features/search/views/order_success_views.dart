import 'package:flutter/material.dart';
import 'package:graduation_project/features/search/views/orders_views.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFE8614A);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, spreadRadius: 2),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.card_giftcard, size: 50, color: Color(0xFFE8614A)),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Order Placed Successfully!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your thoughtful gift is being prepared with care.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Number', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          SizedBox(height: 2),
                          Text('Est. Delivery', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('#GF-98745-XY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          SizedBox(height: 2),
                          Text('Oct 24 - Oct 26', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Continue Shopping Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: () {

                      Navigator.pop(context);
                    },
                    child: const Text('Continue Shopping', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 12),

                // View Order Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const OrdersView()),
                      );
                    },
                    child: Text('View Order', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}