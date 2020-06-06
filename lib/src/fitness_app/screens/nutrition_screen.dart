import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animate_do/animate_do.dart';
import 'package:ui_challenges/src/fitness_app/colors.dart';

import '../../shared/widgets/radial_progress_bar.dart';

const dividingSpace = [
  SizedBox(height: 10.0),
  Divider(),
  SizedBox(height: 10.0),
];

class NutritionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                SlideInDown(
                  child: Text(
                    'Nutrition Fact',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30.0),
                BounceInRight(child: _Indicators()),
                SizedBox(height: 30.0),
                SlideInUp(
                  duration: Duration(milliseconds: 300),
                  child: _FactDetail(
                    color: Colors.deepPurple,
                    label: 'Protein',
                    primary: true,
                    quantity: 4,
                  ),
                ),
                ...dividingSpace,
                SlideInUp(
                  duration: Duration(milliseconds: 500),
                  child: _FactDetail(
                    color: Colors.cyan,
                    label: 'Carbs',
                    primary: true,
                    quantity: 44,
                  ),
                ),
                SizedBox(height: 10.0),
                SlideInUp(
                  duration: Duration(milliseconds: 700),
                  child: _FactDetail(
                    label: 'Fibers',
                    quantity: 4,
                  ),
                ),
                SlideInUp(
                  duration: Duration(milliseconds: 900),
                  child: _FactDetail(
                    label: 'Sugars',
                    quantity: 40,
                  ),
                ),
                ...dividingSpace,
                SlideInUp(
                  duration: Duration(milliseconds: 1100),
                  child: _FactDetail(
                    color: Colors.blue,
                    label: 'Fats',
                    primary: true,
                    quantity: 4,
                  ),
                ),
                SizedBox(height: 10.0),
                SlideInUp(
                  duration: Duration(milliseconds: 1300),
                  child: _FactDetail(
                    label: 'Saturated',
                    quantity: 4,
                  ),
                ),
                ...dividingSpace,
                FadeInUp(
                  duration: Duration(seconds: 2),
                  child: RaisedButton(
                    child: Text(
                      'Got it!',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: darkPurple,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FactDetail extends StatelessWidget {
  const _FactDetail({
    Key key,
    this.primary = false,
    this.color = Colors.white,
    @required this.label,
    @required this.quantity,
  }) : super(key: key);

  final bool primary;
  final Color color;
  final String label;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(width: 10),
        Text(
          this.label,
          style: TextStyle(
            fontSize: primary ? 18.0 : 15.0,
            fontWeight: primary ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Spacer(),
        Text(
          '${this.quantity}g',
          style: TextStyle(
            fontSize: primary ? 18.0 : 15.0,
            fontWeight: primary ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _Indicators extends StatelessWidget {
  const _Indicators({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _Indicator(color: Colors.cyan, label: 'Carbs', percentage: 78),
        _Indicator(color: Colors.deepPurple, label: 'Protein', percentage: 13),
        _Indicator(color: Colors.blue, label: 'Fat', percentage: 9),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key key,
    @required this.percentage,
    @required this.color,
    @required this.label,
  }) : super(key: key);

  final double percentage;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          child: RadialProgressBar(
            valueStrokeWidth: 10.0,
            backgroundStrokeWidth: 10.0,
            percentage: this.percentage,
            showPercentage: true,
            backgroundColor: this.color.withOpacity(0.3),
            valueColor: this.color,
            percentageStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 17.0),
        Text(this.label),
      ],
    );
  }
}
