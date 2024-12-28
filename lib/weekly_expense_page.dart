import 'package:flutter/material.dart';

class WeeklyExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  'Weekly Expense',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'From 1 - 6 Apr, 2024',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('View Report'),
                ),
              ),
              SizedBox(height: 16),
              Stack(
                children: [
                  _buildBubble(
                      150, Colors.purple.shade100, '48%', Colors.purple),
                  Positioned(
                    left: 40,
                    top: 40,
                    child: _buildBubble(
                        100, Colors.green.shade100, '32%', Colors.green),
                  ),
                  Positioned(
                    left: 40,
                    top: 120,
                    child: _buildBubble(
                        80, Colors.red.shade100, '13%', Colors.red),
                  ),
                  Positioned(
                    right: 80,
                    bottom: 40,
                    child: _buildBubble(
                        60, Colors.orange.shade100, '7%', Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Column(
                children: [
                  _buildLegend('Grocery', Colors.purple, "\$758.20"),
                  Text("\$758.20")
                ],
              ),
              _buildLegend('Food & Drink', Colors.green, '\$758.20'),
              _buildLegend('Shopping', Colors.red, '\$758.20'),
              _buildLegend('Transportation', Colors.orange, '\$758.20'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBubble(double size, Color color, String text, Color textColor) {
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
            fontSize: size * 0.3,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(String title, Color color, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
