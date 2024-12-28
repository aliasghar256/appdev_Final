import 'package:flutter/material.dart';

class WeeklyExpensePage extends StatelessWidget {
  const WeeklyExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  'Weekly Expense',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'From 1 - 6 Apr, 2024',
                  style: TextStyle(
                    fontSize: 12, // Reduced font size
                    color: Colors.grey,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View Report',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      top: 40,
                      child: _buildBubble(
                          60, Colors.purple.shade100, '48%', Colors.purple, 16),
                    ),
                    Positioned(
                      right: 30,
                      top: 10,
                      child: _buildBubble(
                          40, Colors.green.shade100, '32%', Colors.green, 12),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 40,
                      child: _buildBubble(
                          30, Colors.red.shade100, '13%', Colors.red, 10),
                    ),
                    Positioned(
                      right: 50,
                      bottom: 10,
                      child: _buildBubble(
                          20, Colors.orange.shade100, '7%', Colors.orange, 8),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBubble(
      double size, Color color, String text, Color textColor, double fontSize) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(Colors.purple, 'Grocery', '\$758.20'),
              _buildCategoryItem(Colors.green, 'Food & Drink', '\$758.20'),
            ],
          ),
          const Divider(height: 24, thickness: 1, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(Colors.red, 'Shopping', '\$758.20'),
              _buildCategoryItem(Colors.orange, 'Transportation', '\$758.20'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(Color color, String title, String amount) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 4,
                backgroundColor: color,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
