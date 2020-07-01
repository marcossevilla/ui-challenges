import 'package:flutter/material.dart';

import '../colors.dart';

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SplashScreen();
  }
}

class _SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _BackgroundCanvas();
  }
}

class _BackgroundCanvas extends StatelessWidget {
  const _BackgroundCanvas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: CustomPaint(painter: _MyPainter()),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // upper big widget
    final upperBig = Paint()
      ..color = kSolidPink
      ..style = PaintingStyle.fill;

    final upperBigPath = Path();
    upperBigPath.lineTo(0, size.height * 0.3);
    upperBigPath.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.2,
      size.width * 0.4,
      size.height * 0.2,
    );
    upperBigPath.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.2,
      size.width * 0.9,
      size.height * -0.18,
    );

    canvas.drawPath(upperBigPath, upperBig);

    // upper small widget
    final upperSmall = Paint()
      ..color = kPinkyPurple
      ..style = PaintingStyle.fill;

    final upperSmallPath = Path();

    upperSmallPath.lineTo(0, size.height * 0.2);
    upperSmallPath.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.17,
      size.width * 0.5,
      0,
    );
    canvas.drawPath(upperSmallPath, upperSmall);
  }

  @override
  bool shouldRepaint(_MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_MyPainter oldDelegate) => false;
}
