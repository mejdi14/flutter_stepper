import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint circule =  Paint()
        ..strokeWidth = 5
        ..color = Colors.black
        ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 150;
    canvas.drawCircle(center, radius, circule);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
    return true;
  }

}