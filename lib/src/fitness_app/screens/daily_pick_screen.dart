import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../widgets/buttons.dart';
import '../widgets/cards.dart';
import '../screens/journal_screen.dart';

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // upper part
          SlideInDown(child: _DailyPick()),
          _NewRecipes(),
        ],
      ),
    );
  }
}

class _NewRecipes extends StatelessWidget {
  const _NewRecipes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, left: 45, bottom: 15),
          width: double.infinity,
          child: FadeIn(
            child: Text(
              'New recipe',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        SlideInRight(child: _RecipeSlider()),
      ],
    );
  }
}

class _RecipeSlider extends StatelessWidget {
  const _RecipeSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: PageView(
        controller: PageController(initialPage: 0, viewportFraction: 0.8),
        children: [
          for (int i = 0; i < 4; i++) RecipeCard(index: i),
        ],
      ),
    );
  }
}

class _DailyPick extends StatelessWidget {
  const _DailyPick({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [darkPurple, lightPurple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .6,
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            SlideInDown(
              child: Text(
                'Daily pick'.toUpperCase(),
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SlideInDown(
              child: Text(
                'Breakfast Ideas',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SlideInRight(
              duration: Duration(seconds: 1),
              child: _MealSlider(),
            ),
            Text(
              'Start your day off right with these\nhealthy breakfast recipes',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            SlideInRight(child: _Buttons()),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 50.0),
      width: 300,
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallButton(
            backgroundColor: darkPurple,
            icon: FontAwesomeIcons.solidBookmark,
            iconColor: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            height: 70,
            width: 200,
            child: LargeButton(
              textColor: darkPurple,
              label: 'Let\'s try',
              backgroundColor: Colors.white,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => JournalScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MealSlider extends StatelessWidget {
  const _MealSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      height: 200,
      width: double.infinity,
      child: PageView(
        controller: PageController(
          viewportFraction: 0.6,
          initialPage: 0,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          for (int i = 0; i < 4; i++)
            Container(
              child: Image.asset('assets/fitness_app/meal-$i.png'),
              height: 100,
              width: 100,
            ),
        ],
      ),
    );
  }
}
