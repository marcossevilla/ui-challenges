import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';

class WhatsAppRedo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomeScreen();
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
                  controller: scrollController,
                ),
              );
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.8,
            builder: (context, ScrollController scrollController) {
              return SlideInUp(
                child: _Sheet(
                  color: kGreenyWhite,
                  controller: scrollController,
                ),
              );
            },
          ),
        ],
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
    this.color,
    this.controller,
  }) : super(key: key);

  final Color color;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: this.color,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
    );
  }
}
