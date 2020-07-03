import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/header_card.dart';
import '../widgets/bank_card.dart';
import '../../shared/widgets/modern_drawer.dart';

const tabs = ['Day', 'Week', 'Month', 'Year'];
const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
const heights = {80: 70, 100: 90, 120: 110, 60: 80, 70: 60, 110: 140, 90: 80};

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
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: DefaultTabController(
          length: 4,
          initialIndex: 1,
          child: Column(
            children: [
              _Tabs(),
              _TabViews(),
              SizedBox(height: 10.0),
              _RadioButtons(),
              _Cards(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [Hero(tag: 'card', child: BankCard()), AddCard()],
      ),
    );
  }
}

class _RadioButtons extends StatelessWidget {
  final _radio = ValueNotifier<int>(0);

  _handleRadioValueChange(int value) => _radio.value = value;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _radio,
      builder: (context, int value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: value,
              activeColor: kPinkyPurple,
              onChanged: _handleRadioValueChange,
            ),
            Text(
              'Average',
              style: TextStyle(color: kNeonAqua, fontWeight: FontWeight.bold),
            ),
            Radio<int>(
              value: 1,
              groupValue: value,
              activeColor: kPinkyPurple,
              onChanged: _handleRadioValueChange,
            ),
            Text(
              'This week',
              style: TextStyle(color: kNeonAqua, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}

class _TabViews extends StatelessWidget {
  const _TabViews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: TabBarView(
        children: [
          Container(),
          _Stats(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        unselectedLabelColor: kPinkyPurple,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        indicator: BoxDecoration(
          color: kPinkyPurple,
          borderRadius: BorderRadius.circular(10.0),
        ),
        tabs: [
          for (var tab in tabs)
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(tab),
              ),
            )
        ],
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < labels.length; i++)
            _StatIndicator(
              label: labels[i],
              labelColor: labels[i] == 'W' ? kSolidPink : kNeonAqua,
              indicatorColor: labels[i] == 'W' ? kSolidPink : kPinkyPurple,
              incomeHeight: heights.keys.elementAt(i).toDouble(),
              spendingHeight: heights.values.elementAt(i).toDouble(),
            ),
        ],
      ),
    );
  }
}

class _StatIndicator extends StatelessWidget {
  const _StatIndicator({
    Key key,
    @required this.label,
    @required this.labelColor,
    @required this.indicatorColor,
    @required this.incomeHeight,
    @required this.spendingHeight,
  }) : super(key: key);

  final String label;
  final Color labelColor;
  final Color indicatorColor;
  final double incomeHeight;
  final double spendingHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _Indicator(
              color: Colors.grey.shade200,
              height: incomeHeight,
            ),
            SizedBox(width: 3.0),
            _Indicator(
              height: spendingHeight,
              color: indicatorColor,
            )
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          label,
          style: TextStyle(color: labelColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key key,
    @required this.color,
    @required this.height,
  }) : super(key: key);

  final Color color;
  final double height;
  final double indicatorWidth = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
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
          _BankingInfo(),
        ],
      ),
    );
  }
}

class _BankingInfo extends StatelessWidget {
  const _BankingInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            right: 15,
            child: HeaderCard(
              backgroundColor: kLighterPink,
              title: 'Income',
              content: '\$1995.45',
              isPrimary: false,
            ),
          ),
          Positioned(
            left: 15,
            child: HeaderCard(
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
