import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../widgets/buttons.dart';

class LunchDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: FadeIn(
                child: Image.asset(
                  'assets/fitness_app/pancakes.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SlideInUp(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: _MealData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealData extends StatelessWidget {
  const _MealData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
      child: FadeInUp(
        duration: Duration(seconds: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'nutrition'.toUpperCase(),
              style: TextStyle(
                color: darkPurple,
                letterSpacing: 3,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Salad with wheat and white egg breakfast',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.fire, color: darkPurple),
                SizedBox(width: 10.0),
                Text(
                  '345',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Text('kcal'),
              ],
            ),
            SizedBox(height: 15.0),
            DropdownButtonFormField(
              items: [DropdownMenuItem(child: Text('Serving (2,000g)'))],
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Container(
                  height: 50,
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('1'),
                      Container(height: 30, width: 1, color: Colors.black26)
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            _Buttons(),
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
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallButton(
            backgroundColor: lighterPurple.withOpacity(0.3),
            icon: FontAwesomeIcons.share,
            iconColor: darkPurple,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              height: 70,
              child: LargeButton(
                textColor: Colors.white,
                label: 'Add to journal',
                backgroundColor: darkPurple,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
