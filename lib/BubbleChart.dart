import 'package:flutter/material.dart';

class BubbleChart extends StatelessWidget {
  const BubbleChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.white, // Optional: background color
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bubble 1
          Positioned(
            left: 40,
            top: 50,
            child: buildBubble(
                80, Colors.purple.shade100, '48%', Colors.purple, 24),
          ),
          // Bubble 2
          Positioned(
            right: 40,
            top: 20,
            child:
                buildBubble(50, Colors.green.shade100, '32%', Colors.green, 18),
          ),
          // Bubble 3
          Positioned(
            left: 80,
            bottom: 60,
            child: buildBubble(40, Colors.red.shade100, '13%', Colors.red, 16),
          ),
          // Bubble 4
          Positioned(
            right: 60,
            bottom: 20,
            child: buildBubble(
                30, Colors.orange.shade100, '7%', Colors.orange, 14),
          ),
        ],
      ),
    );
  }

  Widget buildBubble(double size, Color backgroundColor, String text,
      Color textColor, double fontSize) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
