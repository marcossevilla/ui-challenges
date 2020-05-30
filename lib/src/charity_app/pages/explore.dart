import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/cool_drawer.dart';
import '../widgets/charity_card.dart';
import '../widgets/floating_menu.dart';
import 'learn_more.dart';

class CharityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDrawer(child: _Home());
  }
}

class _Home extends StatelessWidget {
  const _Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SafeArea(
              bottom: false,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _AppBar(),
                  _Swiper(),
                  _LearnMore(),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.08,
              child: _FloatingMenu(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LearnMore extends StatelessWidget {
  const _LearnMore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Learn more',
                  style: Theme.of(context).textTheme.headline6,
                ),
                CupertinoButton(
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.black87),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LearnMorePage()),
                  ),
                ),
              ],
            ),
          ),
          LearnMoreCard(index: 0),
          LearnMoreCard(index: 1),
          LearnMoreCard(index: 2),
          SizedBox(height: 70.0),
        ],
      ),
    );
  }
}

class _FloatingMenu extends StatelessWidget {
  const _FloatingMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinterestMenu(
      show: true,
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      items: [
        PinterestButton(
          icon: FontAwesomeIcons.bullseye,
          onPressed: () {},
        ),
        PinterestButton(
          icon: FontAwesomeIcons.locationArrow,
          onPressed: () {},
        ),
        PinterestButton(
          icon: FontAwesomeIcons.peopleCarry,
          onPressed: () {},
        ),
        PinterestButton(
          icon: FontAwesomeIcons.userAlt,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Swiper extends StatelessWidget {
  const _Swiper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      child: Swiper(
        layout: SwiperLayout.STACK,
        viewportFraction: 0.8,
        itemWidth: 320,
        itemCount: 5,
        itemBuilder: (context, i) => CharityCard(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Let\'s discover a charity event!',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 15.0),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.person, size: 35.0),
            onPressed: () => CustomDrawer.of(context).open(),
          ),
        ],
      ),
    );
  }
}
