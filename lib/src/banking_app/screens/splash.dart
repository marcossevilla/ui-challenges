import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import 'home.dart';
import '../colors.dart';

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Material(child: _SplashScreen());
}

class _SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BackgroundCanvas(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              _Picture(),
              Text(
                'Stay Secure',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: kPinkyPurple,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 10.0),
              Text(
                lorem(paragraphs: 1, words: 12),
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: kNeonAqua,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 10.0),
              _Indicators(),
              Spacer(),
              _BottomButtons(),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ],
    );
  }
}

class _Picture extends StatelessWidget {
  const _Picture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: SvgPicture.asset('assets/banking_app/savings.svg'),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            child: Text(
              'Skip',
              style: TextStyle(color: kNeonAqua, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.white, size: 30.0),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _Indicators extends StatelessWidget {
  const _Indicators({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: i == 2 ? 30.0 : 10.0,
            height: 5.0,
            color: i == 2 ? kSolidPink : Colors.grey.shade300,
          )
      ],
    );
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

// here comes the actual mess, I don't really know how I did this

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
    lowerBigPath.moveTo(0, size.height * 1.5);
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
