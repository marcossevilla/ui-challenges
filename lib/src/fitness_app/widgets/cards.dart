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

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    Key key,
    @required this.height,
    @required this.child,
    @required this.padding,
    @required this.margin,
  }) : super(key: key);

  final double height;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.height,
      padding: this.padding,
      margin: this.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.3),
            offset: Offset(1, 3),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: this.child,
    );
  }
}
