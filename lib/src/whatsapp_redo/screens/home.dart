import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../models/chat.dart';
import '../widgets/chat_tile.dart';

class WhatsAppRedo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: kShinyGreen),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          Container(
            color: kdarkGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _Header(),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.8,
            maxChildSize: 0.8,
            builder: (context, ScrollController scrollController) {
              return SlideInUp(
                child: _Sheet(
                  color: kShinyGreen,
                  child: _Favorites(),
                ),
              );
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.88,
            builder: (context, ScrollController scrollController) {
              return SlideInUp(
                child: _Sheet(
                  color: kGreenyWhite,
                  child: ListView.separated(
                    controller: scrollController,
                    itemCount: chats.length,
                    itemBuilder: (context, i) => ChatTile(index: i),
                    separatorBuilder: (_, __) => SizedBox(width: 10.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit, color: kGreenyWhite),
        onPressed: () {},
      ),
    );
  }
}



class _Favorites extends StatelessWidget {
  const _Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favorite contacts',
                style: TextStyle(fontSize: 15.0, color: kGreenyWhite),
              ),
              Icon(Icons.more_horiz, color: kGreenyWhite),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _FavoriteContact(index: i);
            },
          ),
        ),
      ],
    );
  }
}

class _FavoriteContact extends StatelessWidget {
  const _FavoriteContact({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          child: Icon(Icons.person, color: kGreenyWhite),
          margin: const EdgeInsets.symmetric(horizontal: 17.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.primaries[index],
            border: Border.all(width: 3, color: kGreenyWhite),
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          chats[index].sender.split(' ')[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.bars, color: kGreenyWhite),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.search, color: kGreenyWhite),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _Tab(label: 'Messages', isSelected: true),
                  _Tab(label: 'Online'),
                  _Tab(label: 'Groups'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    Key key,
    @required this.label,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15.0, right: 20.0),
      child: Text(
        this.label,
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: this.isSelected ? Colors.white : Colors.white54,
              fontWeight: this.isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet({
    Key key,
    @required this.color,
    @required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: this.color,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: this.child,
    );
  }
}
