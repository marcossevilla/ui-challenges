import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 20.0,
      ),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  child: _RecipeData(),
                ),
                Positioned(
                  right: -90,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/fitness_app/meal-$index.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RecipeData extends StatelessWidget {
  const _RecipeData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.bookmark, color: Colors.grey),
        SizedBox(height: 30.0),
        Container(
          width: 140,
          child: Text(
            'Mango and avocado salad',
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 18.0),
          ),
        ),
        Text(
          '200 cals',
          style: Theme.of(context).textTheme.caption.copyWith(fontSize: 15.0),
        ),
      ],
    );
  }
}
