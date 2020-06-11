import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../colors.dart';
import '../models/chat.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideInDown(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite contacts',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: kGreenyWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.more_horiz, color: kGreenyWhite),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 100,
          width: double.infinity,
          child: SlideInUp(
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return _FavoriteContact(index: i);
              },
            ),
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinPerfect(
            duration: Duration(milliseconds: 500 * (index + 1)),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kGreenyWhite, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                  imageUrl: chats[index].imageURL,
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            chats[index].sender.split(' ')[0],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
