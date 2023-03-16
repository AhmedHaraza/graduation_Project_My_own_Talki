  import 'package:flutter/material.dart';
  
  class MyPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      Paint paint = Paint();
      Path path = Path();
  

      // Path number 1
  

      paint.color = const Color(0xffFE431D);
      path = Path();
      path.lineTo(0, 0);
      path.cubicTo(0, 0, size.width, 0, size.width, 0);
      path.cubicTo(size.width, 0, size.width, size.height * 0.88, size.width, size.height * 0.88);
      path.cubicTo(size.width, size.height * 0.88, size.width * 0.7, size.height, size.width / 2, size.height);
      path.cubicTo(size.width * 0.3, size.height, 0, size.height * 0.88, 0, size.height * 0.88);
      path.cubicTo(0, size.height * 0.88, 0, 0, 0, 0);
      path.cubicTo(0, 0, 0, 0, 0, 0);
      canvas.drawPath(path, paint);
    }
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }
  }
