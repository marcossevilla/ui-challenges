import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_challenges/src/fitness_app/screens/lunch_detail_screen.dart';

import '../colors.dart';
import '../widgets/cards.dart';
import '../widgets/buttons.dart';
import '../extensions/date_ext.dart';
import '../extensions/string_ext.dart';

class JournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dates = DateExt.getRandomDates(7);

    return Scaffold(
      appBar: AppBar(
        title: SlideInUp(child: Text('Journal')),
        backgroundColor: lightPurple,
        elevation: 0.0,
      ),
      backgroundColor: lightPurple,
      body: Column(
        children: [
          SlideInRight(child: _DateSlider(dates: dates)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: SlideInUp(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      FadeInLeft(child: _SearchBar()),
                      FadeInUp(child: _MealCard(title: 'Breakfast')),
                      FadeInUp(child: _MealCard(title: 'Lunch')),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      height: 430,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.title.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: darkPurple,
                          fontSize: 14.0,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(FontAwesomeIcons.fire, color: darkPurple),
                      SizedBox(width: 10.0),
                      Text('120',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      Text('kcal'),
                      SizedBox(width: 5.0),
                      Text('/450 kcal'),
                    ],
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                child: SmallButton(
                  icon: FontAwesomeIcons.plus,
                  iconColor: darkPurple,
                  backgroundColor: lighterPurple.withOpacity(0.2),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          _MealTile(),
          SizedBox(height: 5.0),
          Divider(),
          SizedBox(height: 5.0),
          _MealTile(isLow: false),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          _Warning(),
        ],
      ),
    );
  }
}

class _Warning extends StatelessWidget {
  const _Warning({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your pumpkin soup is high in carbs. Try to substitute...',
                style: TextStyle(color: Colors.black54),
              ),
              Spacer(),
              Text(
                'Read more',
                style: TextStyle(
                  color: darkPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset('assets/fitness_app/food.png', fit: BoxFit.cover),
        ),
      ],
    );
  }
}

class _MealTile extends StatelessWidget {
  const _MealTile({Key key, this.isLow = true}) : super(key: key);

  final bool isLow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LunchDetailScreen()),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/fitness_app/pancakes.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: -3,
                bottom: -3,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isLow
                        ? FontAwesomeIcons.solidSmile
                        : FontAwesomeIcons.solidSadTear,
                    color: isLow ? lighterPurple : Colors.red.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            width: 180.0,
            height: 80.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Salad with wheat and white egg',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text('200 cals', style: Theme.of(context).textTheme.caption),
                SizedBox(height: 5.0),
                if (!this.isLow)
                  Text(
                    'Very high carb!'.toUpperCase(),
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.red.withOpacity(0.6),
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      padding: const EdgeInsets.only(left: 10.0),
      margin: const EdgeInsets.only(
          top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
      height: 55,
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10.0),
          Text(
            'Search meal...',
            style: TextStyle(color: Colors.grey, fontSize: 17.0),
          ),
        ],
      ),
    );
  }
}

class _DateSlider extends StatelessWidget {
  const _DateSlider({Key key, @required this.dates}) : super(key: key);

  final List<DateTime> dates;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: lightPurple,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.17, initialPage: 7),
        itemCount: dates.length,
        itemBuilder: (context, i) {
          return _DateIndicator(date: dates[i]);
        },
      ),
    );
  }
}

class _DateIndicator extends StatelessWidget {
  const _DateIndicator({Key key, @required this.date}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final bool isToday = date.day == DateTime.now().day;

    return Container(
      margin: const EdgeInsets.only(right: 10.0, bottom: 15.0, top: 10.0),
      height: 40,
      width: 50.0,
      decoration: BoxDecoration(
        color: isToday ? darkPurple : lightPurple,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            StringExt.initials(DateExt.getDayStr(date)).toUpperCase(),
            style: TextStyle(
              color: isToday ? Colors.white : Colors.white54,
              fontSize: 11.0,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          CircleAvatar(
            backgroundColor: isToday ? Colors.white : lightPurple,
            child: Text(
              date.day.toString(),
              style: TextStyle(
                color: isToday ? darkPurple : Colors.white,
                fontSize: 18.0,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
