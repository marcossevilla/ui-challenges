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
    final pinkUpper = Paint()
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

    canvas.drawPath(upperBigPath, pinkUpper);

    // upper small widget
    final purpleUpper = Paint()
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
    canvas.drawPath(upperSmallPath, purpleUpper);

    // lower big widget

    final purpleLower = Paint()
      ..color = kPinkyPurple
      ..style = PaintingStyle.fill;

    final lowerBigPath = Path();
    lowerBigPath.moveTo(0, size.height * 1.4);
    lowerBigPath.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.7,
      size.width,
      size.height * 0.8,
    );
    lowerBigPath.lineTo(size.width, size.height);

    canvas.drawPath(lowerBigPath, purpleLower);

    // lower small widget
    final pinkLower = Paint()
      ..color = kSolidPink
      ..style = PaintingStyle.fill;

    final lowerSmallPath = Path();
    lowerSmallPath.moveTo(0, size.height * 1.5);
    lowerSmallPath.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.65,
      size.width * 1.2,
      size.height * 0.9,
    );
    lowerSmallPath.lineTo(size.width, size.height);
    canvas.drawPath(lowerSmallPath, pinkLower);
  }

  @override
  bool shouldRepaint(_MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_MyPainter oldDelegate) => false;
}
