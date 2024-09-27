import 'package:flutter/material.dart';

class SemiCircleShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.0);

    var firstEndpoint = Offset(size.width * 0.9, size.height * 0.0);
    var firstControlPoint = Offset(size.width * 0.45, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class SemiCircleShapeClipper2 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.7, size.height * 0.0);

    var firstEndpoint = Offset(size.width, size.height * 0.8);
    var firstControlPoint = Offset(size.width * 0.6, size.height * 0.7);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
