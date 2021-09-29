import 'package:flutter/material.dart';

class NavBarPainter extends CustomPainter {
  BuildContext context;
  double height = 50;
  double width;

  NavBarPainter(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint();
    painter.color = Colors.white;
    painter.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(10, height / 2);
    path.lineTo(10, 10);
    path.arcToPoint(Offset(20, 0),
        radius: Radius.circular(10), clockwise: true);
    path.lineTo(width * 5 / 16, 0);

    path.quadraticBezierTo(width * 6.4 / 16, 0, width * 7 / 16, 20);

    path.quadraticBezierTo(width * 8 / 16, 46, width * 9 / 16, 20);

    path.quadraticBezierTo(width * 9.6 / 16, 0, width * 11 / 16, 0);

    path.lineTo(width - 20, 0);
    path.arcToPoint(Offset(width - 10, 10),
        radius: Radius.circular(10), clockwise: true);
    path.lineTo(width - 10, 40);
    path.arcToPoint(Offset(width - 20, 50),
        radius: Radius.circular(10), clockwise: true);
    path.lineTo(20, 50);
    path.arcToPoint(Offset(10, 40),
        radius: Radius.circular(10), clockwise: true);

    path.close();
    canvas.drawShadow(path.shift(Offset(0, -1)), Colors.grey, 1.5, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
