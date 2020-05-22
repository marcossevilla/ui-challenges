import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenges/src/food_app/pages/detail.dart';

import '../constants.dart' as constants;
import '../models/dishes.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.0,
              width: 120.0,
              child: Image.asset(Dishes.types[index].image),
            ),
            SizedBox(height: 10.0),
            Text(Dishes.types[index].name),
          ],
        ),
      ),
    );
  }
}

class DishCard extends StatelessWidget {
  const DishCard({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0.0,
      closedColor: Colors.transparent,
      openBuilder: (context, void Function() action) {
        return DetailPage(index: index);
      },
      closedBuilder: (context, void Function() action) {
        return Container(
          width: 200,
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 10,
                child: _DishCard(index: index),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 150,
                  width: 150,
                  child: Hero(
                    tag: 'dish-$index',
                    child: Image.asset(
                      'assets/food_app/dish-${this.index + 1}.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DishCard extends StatelessWidget {
  const _DishCard({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: constants.shadedDecoration,
      width: 200.0,
      height: 200.0,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15.0),
      child: _DishContent(index: index),
    );
  }
}

class _DishContent extends StatelessWidget {
  const _DishContent({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final int stars = Dishes.dishes[index].rating.toInt();
    final int extraStars = 5 - stars;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Dishes.dishes[index].name,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Icon(Icons.location_on, color: constants.kPrimaryColor),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                Dishes.dishes[index].place,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            for (int i = 0; i < stars; i++)
              Icon(
                Icons.star,
                color: constants.kPrimaryColor,
              ),
            for (int i = 0; i < extraStars; i++)
              Icon(
                Icons.star,
                color: Colors.grey,
              )
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          '\$' + Dishes.dishes[index].price.toStringAsFixed(0),
          overflow: TextOverflow.fade,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: constants.kPrimaryColor),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
