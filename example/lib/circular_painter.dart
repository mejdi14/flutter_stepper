import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    print('width : $width height: $height');
    var paint1 = Paint()
      ..color = Color(0xff000000)
      ..style = PaintingStyle.fill;

    //a circle
    //size =Size(size.width - 100, size.height - 100);
    var centerY = height * .5 ,
        centerX = width * .5 ,
        offset = 50 ,
        speed = height * .001 ,
        baseRadius = 50 + math.sin(math.pi * 2) * offset;
    canvas.drawCircle(Offset(centerX, centerY), 20, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}