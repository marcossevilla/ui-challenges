import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_challenges/src/food_app/constants.dart';
import 'package:ui_challenges/src/shared/widgets/box_shadow.dart';
import 'package:ui_challenges/src/shared/widgets/modern_app_bar.dart';

class FakeData {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool hasImage;

  FakeData({
    this.icon,
    this.title,
    this.subtitle,
    this.hasImage = false,
  });
}

final facts = [
  FakeData(
    icon: FontAwesomeIcons.cloudSun,
    title: 'Shutterr',
    subtitle: 'Most popular on',
  ),
  FakeData(
    icon: FontAwesomeIcons.solidSave,
    title: '1509.89',
    subtitle: 'You have earned',
    hasImage: true,
  ),
  FakeData(
    icon: FontAwesomeIcons.pencilAlt,
    title: 'Illustrations',
    subtitle: 'Best selling',
  ),
  FakeData(
    icon: FontAwesomeIcons.userAlt,
    title: '150.263',
    subtitle: 'Customers',
    hasImage: true,
  ),
];

class FunFactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Column(
          children: [
            _AppBar(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: facts.length,
                itemBuilder: (context, i) => _FactCard(index: i),
                separatorBuilder: (_, __) => SizedBox(height: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FactCard extends StatelessWidget {
  const _FactCard({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final fact = facts[index];
    final color = Colors.primaries[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: color.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.all(15.0),
                child: Icon(fact.icon, color: color.shade800),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [cardShadow()],
                ),
              ),
              Text(
                fact.subtitle,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: color.shade900,
                    ),
              ),
              Text(
                fact.title,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: color.shade900,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (fact.hasImage)
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  height: 300.0,
                  child: SvgPicture.asset('assets/auction_app/draw_$index.svg'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModernAppBar(
      leftChildren: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fun facts',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'The author\'s life',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
      rightChildren: [BackButton()],
    );
  }
}
