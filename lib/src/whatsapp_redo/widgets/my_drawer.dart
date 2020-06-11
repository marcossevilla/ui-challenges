import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';

final Map<String, IconData> items = {
  'Account': FontAwesomeIcons.key,
  'Chats': FontAwesomeIcons.solidComment,
  'Notifications': FontAwesomeIcons.solidBell,
  'Data and Storage': FontAwesomeIcons.database,
  'Help': FontAwesomeIcons.question,
};

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        bottomRight: Radius.circular(40.0),
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(color: kdarkGrey),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15.0),
                SlideInDown(
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 30.0),
                SlideInLeft(child: _UserInfo()),
                _Tiles(),
                SlideInLeft(child: _Divider()),
                SlideInLeft(
                  duration: Duration(seconds: 2),
                  child: _Tile(icon: Icons.person_add, text: 'Invite a friend'),
                ),
                Spacer(),
                SlideInUp(
                  child: _Tile(icon: Icons.exit_to_app, text: 'Log out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30.0),
        CircleAvatar(
          child: Icon(
            FontAwesomeIcons.userAlt,
            color: kdarkGrey,
          ),
          backgroundColor: kShinyGreen,
        ),
        SizedBox(width: 15.0),
        Text(
          'Marcos Sevilla',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Icon(this.icon, color: Colors.white),
        title: Text(this.text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Divider(color: kShinyGreen, thickness: 1),
    );
  }
}

class _Tiles extends StatelessWidget {
  const _Tiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, i) {
          return SlideInLeft(
            duration: Duration(milliseconds: 300 * (i + 1)),
            child: _Tile(
              text: items.keys.elementAt(i),
              icon: items.values.elementAt(i),
            ),
          );
        },
      ),
    );
  }
}
