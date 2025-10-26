import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for orders
    final List<Map<String, String>> orders = [
      {
        'orderId': 'ORD-001',
        'item': 'Urea Fertilizer',
        'quantity': '50 Kg',
        'status': 'Order confirmed'
      },
      {
        'orderId': 'ORD-002',
        'item': 'Paddy Seeds (Brand A)',
        'quantity': '25 Kg',
        'status': 'PO issued'
      },
      {
        'orderId': 'ORD-003',
        'item': 'Pesticide (Brand B)',
        'quantity': '5 Ltr',
        'status': 'Delivery scheduled'
      },
      {
        'orderId': 'ORD-004',
        'item': 'Wheat Seeds (Brand C)',
        'quantity': '100 Kg',
        'status': 'Delivered'
      },
    ];

    Color getStatusColor(String status) {
      switch (status) {
        case 'Order confirmed':
          return Colors.blue;
        case 'PO issued':
          return Colors.orange;
        case 'Delivery scheduled':
          return Colors.purple;
        case 'Delivered':
          return Colors.green;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('${order['item']} - ${order['orderId']}'),
              subtitle: Text('Quantity: ${order['quantity']}'),
              trailing: Chip(
                label: Text(
                  order['status']!,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: getStatusColor(order['status']!),
              ),
            ),
          );
        },
      ),
    );
  }
}
