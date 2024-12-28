import 'package:flutter/material.dart';

class BubbleChart extends StatelessWidget {
  const BubbleChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: BubbleChartPainter(),
    );
  }
}

class BubbleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw largest circle
    paint.color = Colors.purple.shade100;
    canvas.drawCircle(const Offset(120, 120), 80, paint);
    drawText(canvas, '48%', Offset(120, 120), Colors.purple, 24);

    // Draw medium circle
    paint.color = Colors.green.shade100;
    canvas.drawCircle(const Offset(220, 80), 50, paint);
    drawText(canvas, '32%', Offset(220, 80), Colors.green, 18);

    // Draw small circle (red)
    paint.color = Colors.red.shade100;
    canvas.drawCircle(const Offset(190, 180), 40, paint);
    drawText(canvas, '13%', Offset(190, 180), Colors.red, 16);

    // Draw smallest circle (yellow)
    paint.color = Colors.orange.shade100;
    canvas.drawCircle(const Offset(260, 150), 30, paint);
    drawText(canvas, '7%', Offset(260, 150), Colors.orange, 14);
  }

  void drawText(
      Canvas canvas, String text, Offset offset, Color color, double fontSize) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final textOffset = Offset(
        offset.dx - textPainter.width / 2, offset.dy - textPainter.height / 2);
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
