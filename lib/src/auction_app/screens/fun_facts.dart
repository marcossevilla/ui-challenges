import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

final data = [
  FakeData(
    icon: FontAwesomeIcons.cloudSun,
    title: 'Shutterr',
    subtitle: 'Most popular on',
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
                itemCount: null,
                itemBuilder: null,
                separatorBuilder: null,
              ),
            ),
          ],
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
