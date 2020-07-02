import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:animate_do/animate_do.dart';

import 'package:ui_challenges/src/auction_app/data/fake_data.dart';
import 'package:ui_challenges/src/shared/widgets/modern_drawer.dart';
import 'package:ui_challenges/src/shared/widgets/modern_app_bar.dart';
import 'package:ui_challenges/src/auction_app/screens/fun_facts.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Column(
          children: [
            _AppBar(),
            _Slider(),
            _Button(),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Find full details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => FunFactsScreen()),
      ),
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({Key key}) : super(key: key);

  @override
  __SliderState createState() => __SliderState();
}

class __SliderState extends State<_Slider> {
  Timer _timer;
  PageController _pageController;

  // methods to repeat pageview elements

  static int _repeat(int index) =>
      data.length * ((index / data.length).floor());
  static int _index(int index) =>
      index > data.length - 1 ? index - _repeat(index) : index;

  @override
  void initState() {
    _pageController = PageController();

    _timer = Timer.periodic(
      const Duration(milliseconds: 2700),
      (timer) {
        _pageController.nextPage(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SlideInDown(
                  child: Text(
                    data.keys.elementAt(_index(i)),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SlideInDown(
                  child: Text(
                    data.values.elementAt(_index(i)),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              SlideInUp(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/auction_app/draw_${_index(i)}.svg',
                  ),
                ),
              ),
            ],
          );
        },
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Dmm',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(width: 20.0, height: 5.0, color: Colors.orange),
          ],
        ),
      ],
      rightChildren: [
        ModernDrawer(),
      ],
    );
  }
}
