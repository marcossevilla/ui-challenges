import 'package:flutter/material.dart';

import '../colors.dart';
import '../../shared/widgets/modern_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSolidPink,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _Header(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ModernDrawer()],
          ),
          SizedBox(height: 20.0),
          Text(
            'Total Balance',
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            '\$995.58',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 20.0),
          _Cards(),
        ],
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            right: 15,
            child: _HeaderCard(
              backgroundColor: kLighterPink,
              title: 'Income',
              content: '\$1995.45',
              isPrimary: false,
            ),
          ),
          Positioned(
            left: 15,
            child: _HeaderCard(
              backgroundColor: kPinkyPurple,
              title: 'Spending',
              content: '\$995.58',
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    Key key,
    @required this.backgroundColor,
    @required this.title,
    @required this.content,
    this.isPrimary = true,
  }) : super(key: key);

  final bool isPrimary;
  final String title;
  final String content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isPrimary
            ? BorderRadius.circular(20.0)
            : BorderRadius.horizontal(right: Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: isPrimary ? Colors.white : Colors.white70,
                ),
          ),
          SizedBox(height: 5.0),
          Text(
            content,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: isPrimary ? Colors.white : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
