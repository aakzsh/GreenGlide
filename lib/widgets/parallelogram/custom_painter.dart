import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';

class ParallelogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = AppColors.green
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(
          size.width * 0.85, size.height) // Adjust the width ratio as needed
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.15, 0) // Adjust the width ratio as needed
      ..close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}