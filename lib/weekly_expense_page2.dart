import 'package:flutter/material.dart';

class WeeklyExpensePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
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
                  Text(
                    'Weekly Expense',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'From 1 - 6 Apr, 2024',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'View Report',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: Bubble(
                    percentage: '32%',
                    size: 120,
                    color: Colors.green[100]!,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Bubble(
                    percentage: '13%',
                    size: 80,
                    color: Colors.red[100]!,
                  ),
                ),
                Positioned(
                  left: 100,
                  bottom: 60,
                  child: Bubble(
                    percentage: '7%',
                    size: 60,
                    color: Colors.orange[100]!,
                  ),
                ),
                Bubble(
                  percentage: '48%',
                  size: 150,
                  color: Colors.purple[100]!,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          ExpenseItem(
            label: 'Grocery',
            amount: '\$758.20',
            color: Colors.purple,
          ),
          ExpenseItem(
            label: 'Food & Drink',
            amount: '\$758.20',
            color: Colors.green,
          ),
          ExpenseItem(
            label: 'Shopping',
            amount: '\$758.20',
            color: Colors.red,
          ),
          ExpenseItem(
            label: 'Transportation',
            amount: '\$758.20',
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  final String percentage;
  final double size;
  final Color color;

  Bubble({
    required this.percentage,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        percentage,
        style: TextStyle(
          fontSize: size * 0.25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final String label;
  final String amount;
  final Color color;

  ExpenseItem({
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
