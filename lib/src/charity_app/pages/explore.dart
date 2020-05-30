import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:animate_do/animate_do.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/cool_drawer.dart';
import '../widgets/charity_card.dart';
import '../widgets/floating_menu.dart';

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
              child: Column(
                children: [
                  _AppBar(),
                  _Swiper(),

                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.04,
              child: _FloatingMenu(),
            ),
          ],
        ),
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
      height: MediaQuery.of(context).size.height * 0.65,
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
          CircleAvatar(child: Icon(Icons.person)),
        ],
      ),
    );
  }
}
