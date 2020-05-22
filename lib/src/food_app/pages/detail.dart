import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/dishes.dart';
import '../widgets/rolling_switch.dart';
import '../constants.dart' as constants;

class DetailPage extends StatelessWidget {
  const DetailPage({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(index: index),
                SizedBox(height: 10.0),
                FadeInUp(child: _Headline(index: index)),
                SizedBox(height: 10.0),
                Divider(),
                _DishStats(index: index),
                Divider(),
                _DishDescription(),
                ElasticInLeft(child: _AddToCartSwitch()),
              ],
            ),
          ),
          _FloatButton(),
        ],
      ),
    );
  }
}

class _AddToCartSwitch extends StatelessWidget {
  const _AddToCartSwitch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RollingSwitch(
        value: false,
        textOn: 'Added to cart!',
        textOff: 'Swipe to add to cart',
        colorOn: Colors.lightGreen,
        colorOff: constants.kPrimaryColor,
        iconOn: Icons.done,
        iconOff: FontAwesomeIcons.shoppingBag,
        textSize: 16.0,
        onChanged: (bool state) {},
      ),
    );
  }
}

class _DishDescription extends StatelessWidget {
  const _DishDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElasticInLeft(
        child: Text(
          lorem(paragraphs: 2, words: 60),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

class _DishStats extends StatelessWidget {
  const _DishStats({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final List<_DishStat> list = [
      _DishStat(
        FontAwesomeIcons.solidStar,
        Dishes.dishes[index].rating.toString(),
      ),
      _DishStat(
        FontAwesomeIcons.solidClock,
        Dishes.dishes[index].deliveryTime.toString() + ' min',
      ),
      _DishStat(
        FontAwesomeIcons.locationArrow,
        Dishes.dishes[index].distance.toString() + ' km',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < list.length; i++)
            FadeInLeft(
              duration: Duration(milliseconds: (i + 1) * 700),
              child: _DishStatItem(dish: list[i]),
            ),
        ],
      ),
    );
  }
}

class _DishStat {
  final IconData icon;
  final String title;

  _DishStat(this.icon, this.title);
}

class _DishStatItem extends StatelessWidget {
  const _DishStatItem({Key key, this.dish}) : super(key: key);

  final _DishStat dish;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(dish.icon, color: constants.kPrimaryColor),
        SizedBox(width: 5.0),
        Text(dish.title),
      ],
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Dishes.dishes[index].name,
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: constants.kPrimaryColor),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        Dishes.dishes[index].place,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            '\$' + Dishes.dishes[index].price.toStringAsFixed(0),
            overflow: TextOverflow.fade,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: constants.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}

class _FloatButton extends StatelessWidget {
  const _FloatButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 270.0,
      right: 20.0,
      child: SpinPerfect(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          child: Icon(FontAwesomeIcons.solidHeart),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _DishImage(index: index),
          Positioned(
            left: 15,
            top: 40,
            child: BounceInLeft(
              child: InkWell(
                child: Container(
                  decoration: constants.shadedDecoration,
                  child: Icon(Icons.chevron_left, size: 35.0),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DishImage extends StatelessWidget {
  const _DishImage({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.pink.withOpacity(0.1),
      child: Hero(
        tag: 'dish-$index',
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.08, bottom: 30.0),
          child: Image.asset('assets/food_app/dish-${index + 1}.png'),
        ),
      ),
    );
  }
}
