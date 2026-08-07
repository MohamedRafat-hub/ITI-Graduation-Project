import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Color primaryColor = const Color(0xFFE8614A);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
        title: const Text('My Orders', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: primaryColor,
          tabs: const [
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Ongoing Orders List
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildOrderItem(
                orderId: '#928374',
                date: 'Oct 24, 2023',
                title: 'Minimalist...',
                price: '\$85.00',
                status: 'Processing',
                statusColor: Colors.amber.shade700,
              ),
              _buildOrderItem(
                orderId: '#928321',
                date: 'Oct 20, 2023',
                title: 'Artisan...',
                price: '\$120.00',
                status: 'Shipped',
                statusColor: Colors.orange.shade700,
              ),
            ],
          ),

          const Center(
            child: Text('No completed orders yet', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String orderId,
    required String date,
    required String title,
    required String price,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order $orderId', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(date, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Divider(height: 16),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Qty: 1', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              Text(price, style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}