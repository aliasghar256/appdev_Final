import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // First row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryItem(
                color: Colors.purple,
                title: 'Grocery',
                amount: '\$758.20',
              ),
              CategoryItem(
                color: Colors.green,
                title: 'Food & Drink',
                amount: '\$758.20',
              ),
            ],
          ),
          const Divider(height: 32, thickness: 1, color: Colors.grey),
          // Second row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryItem(
                color: Colors.red,
                title: 'Shopping',
                amount: '\$758.20',
              ),
              CategoryItem(
                color: Colors.orange,
                title: 'Transportation',
                amount: '\$758.20',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String amount;

  const CategoryItem({
    Key? key,
    required this.color,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: color,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
