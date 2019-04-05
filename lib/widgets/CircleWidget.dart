import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

class CircleWidget extends CustomPainter {

  final Color color;
  Paint _paint;

  CircleWidget(this.color) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}