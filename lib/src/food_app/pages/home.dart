import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/dishes.dart';
import '../widgets/cards.dart';
import '../constants.dart' as constants;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            color: constants.kSecondaryColor,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                SlideInLeft(
                  duration: Duration(milliseconds: 600),
                  child: _AppBar(),
                ),
                SizedBox(height: 20.0),
                FadeInLeft(
                  duration: Duration(milliseconds: 700),
                  child: _SearchBar(),
                ),
                SizedBox(height: 20.0),
                SlideInRight(
                  duration: Duration(milliseconds: 800),
                  child: _HorizontalList(
                    items: Dishes.types,
                    itemBuilder: (context, int i) => TypeCard(index: i),
                  ),
                ),
                SlideInLeft(
                  duration: Duration(milliseconds: 900),
                  child: _PopularFoodsTitle(),
                ),
                SizedBox(height: 10.0),
                SlideInRight(
                  duration: Duration(milliseconds: 1000),
                  child: _HorizontalList(
                    isLarge: true,
                    items: Dishes.dishes,
                    itemBuilder: (context, int i) => DishCard(index: i),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BounceInUp(
        duration: Duration(milliseconds: 1500),
        child: _BottomNavBar(),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FontAwesomeIcons.home, color: constants.kPrimaryColor),
            Icon(FontAwesomeIcons.shoppingBag, color: Colors.grey),
            Icon(Icons.location_on, color: Colors.grey),
            Icon(Icons.person, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _PopularFoodsTitle extends StatelessWidget {
  const _PopularFoodsTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular Foods',
            style: Theme.of(context).textTheme.headline5,
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.teal.withOpacity(0.8),
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HorizontalList extends StatelessWidget {
  const _HorizontalList({
    Key key,
    this.items,
    this.itemBuilder,
    this.isLarge = false,
  }) : super(key: key);

  final bool isLarge;
  final List<Object> items;
  final Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.isLarge ? 300.0 : 130.0,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: this.items.length,
        itemBuilder: this.itemBuilder,
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          height: 50.0,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Foods items',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          child: Icon(FontAwesomeIcons.filter, color: Colors.grey),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
        )
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: constants.kPrimaryColor,
          ),
          Text(
            'How Hungry are You Today?',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
