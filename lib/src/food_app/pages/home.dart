import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart' as constants;
import '../models/dishes.dart';

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
                _AppBar(),
                _SearchBar(),
                SizedBox(height: 20.0),
                _TypeList(),
                _PopularFoodsTitle(),
              ],
            ),
          ),
        ],
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
      child: Text(
        'Popular Foods',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class _TypeList extends StatelessWidget {
  const _TypeList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Dishes.types.length,
        itemBuilder: (context, int i) => _TypeCard(index: i),
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
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
