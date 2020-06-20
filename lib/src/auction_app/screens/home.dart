import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_challenges/src/auction_app/widgets/profile_button.dart';
import 'package:ui_challenges/src/auction_app/widgets/swiper_card.dart';
import 'package:ui_challenges/src/shared/widgets/modern_app_bar.dart';
import 'package:ui_challenges/src/shared/widgets/search_bar.dart';

class AuctionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurple,
      ),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              _AppBar(),
              SizedBox(height: 15.0),
              SearchBar(),
              _Swiper(),
            ],
          ),
        ),
        bottomNavigationBar: _BottomNavBar(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModernAppBar(
      leftChildren: [
        Text(
          'Refund requests',
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '26 refund requests',
          style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 15.0,
              ),
        ),
      ],
      rightChildren: [ProfileButton()],
    );
  }
}

class _Swiper extends StatelessWidget {
  const _Swiper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.4,
      child: Swiper(
        itemCount: 5,
        itemWidth: 500,
        itemHeight: MediaQuery.of(context).size.width * 1.4,
        layout: SwiperLayout.TINDER,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: SwiperCard(),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidChartBar),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.calendar),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.chartLine),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.folder),
          title: Container(),
        ),
      ],
    );
  }
}


