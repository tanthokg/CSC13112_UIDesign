import 'package:flutter/material.dart';

class DashedLineVerticalPainter extends CustomPainter {
  final Color colorLine;

  DashedLineVerticalPainter(this.colorLine);

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 6, dashSpace = 1, startY = 0;
    final paint = Paint()
      ..color = colorLine
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}