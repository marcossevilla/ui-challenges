import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'internet_image.dart';

import '../colors.dart';
import '../models/chat.dart';
import '../screens/chat.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final chat = chats[this.index];

    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: ListTile(
        leading: InternetImage(url: chats[index].imageURL),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.sender,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 5.0),
            Text(
              chat.message,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              chat.time,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 5.0),
            if (chat.unread > 0)
              Container(
                alignment: Alignment.center,
                width: 25.0,
                height: 25.0,
                child: Text(
                  '${chat.unread}',
                  style: TextStyle(color: kGreenyWhite),
                ),
                decoration: BoxDecoration(
                  color: kShinyGreen,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ChatScreen()),
        ),
      ),
    );
  }
}
