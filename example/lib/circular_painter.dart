import 'dart:math';

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

    // paint the animation
    Paint animationArc = Paint()
    ..strokeWidth = 5
    ..color = Colors.orange
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (20 / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2, angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
    return true;
  }

}