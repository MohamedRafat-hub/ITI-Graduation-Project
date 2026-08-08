import 'package:flutter/material.dart';
import 'package:graduation_project/features/search/views/order_success_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/search/presentation/cubit/shopping_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int selectedPaymentMethod = 0;
  final Color primaryColor = const Color(0xFFE8614A);

  @override
  Widget build(BuildContext context) {
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
          'Checkout',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextButton(
                  onPressed: () {

                  },
                  child: Text('Edit', style: TextStyle(color: primaryColor)),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.grey),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jane Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('123 Premium Minimalist Way, Apt 4B',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('New York, NY 10001',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method Section
            const Text('Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),

            // Card Option
            GestureDetector(
              onTap: () => setState(() => selectedPaymentMethod = 0),
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedPaymentMethod == 0 ? primaryColor : Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: selectedPaymentMethod,
                          activeColor: primaryColor,
                          onChanged: (val) => setState(() => selectedPaymentMethod = val!),
                        ),
                        const Icon(Icons.credit_card, color: Colors.grey),
                        const SizedBox(width: 8),
                        const Text('•••• 4242', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Default', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ),
                  ],
                ),
              ),
            ),

            // Digital Wallet Option
            GestureDetector(
              onTap: () => setState(() => selectedPaymentMethod = 1),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedPaymentMethod == 1 ? primaryColor : Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: selectedPaymentMethod,
                      activeColor: primaryColor,
                      onChanged: (val) => setState(() => selectedPaymentMethod = val!),
                    ),
                     const Icon(Icons.account_balance_wallet_outlined, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Text('Digital Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Order Totals Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal', style: TextStyle(color: Colors.grey)),
                      Text('\$117.00', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping', style: TextStyle(color: Colors.grey)),
                      Text('\$5.00', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Taxes', style: TextStyle(color: Colors.grey)),
                      Text('\$10.53', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('\$132.53', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFC47B62))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),


            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),


                onPressed: () async {
                  try {

                    final user = FirebaseAuth.instance.currentUser;
                    await FirebaseFirestore.instance.collection('orders').add({
                      'userId': user?.uid,
                      'total': 132.53,
                      'createdAt': FieldValue.serverTimestamp(),
                    });


                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderSuccessView()),
                    );
                  } catch (e) {
                    print("Error: $e");
                  }
                },



                child: const Text(
                  'Place Order',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}