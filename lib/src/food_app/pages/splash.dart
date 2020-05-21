import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';
import '../constants.dart' as constants;

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SplashPage();
  }
}

class _SplashPage extends StatelessWidget {
  const _SplashPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: -70,
            child: _Circle(isBig: true),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            right: 30,
            child: _Circle(),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MainContent(),
                Spacer(),
                Expanded(
                  child: SvgPicture.asset('assets/food_app/delivery.svg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get\nthe Fastest\nDelivery',
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Order Food and get\nDelivery in Fastest time in Town',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            color: constants.kPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0,
              ),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => HomePage()),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({
    Key key,
    this.isBig = false,
  }) : super(key: key);

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.isBig ? 350 : 100,
      width: this.isBig ? 350 : 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.1),
      ),
    );
  }
}
