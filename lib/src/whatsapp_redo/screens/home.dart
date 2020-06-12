import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../models/chat.dart';
import '../widgets/sheet.dart';
import '../widgets/my_drawer.dart';
import '../widgets/chat_tile.dart';
import '../widgets/favorites.dart';

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
      drawer: MyDrawer(),
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
                child: Sheet(color: kShinyGreen, child: Favorites()),
              );
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.88,
            builder: (context, ScrollController scrollController) {
              return SlideInUp(
                child: Sheet(
                  color: kGreenyWhite,
                  child: ListView.separated(
                    controller: scrollController,
                    itemCount: chats.length,
                    itemBuilder: (context, i) {
                      return SlideInLeft(child: ChatTile(index: i));
                    },
                    separatorBuilder: (_, __) => Divider(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: ElasticIn(
        child: FloatingActionButton(
          child: Icon(Icons.edit, color: kGreenyWhite),
          onPressed: () {},
        ),
      ),
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
            SlideInDown(
              child: Padding(
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
            ),
            SlideInRight(
              child: Container(
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
