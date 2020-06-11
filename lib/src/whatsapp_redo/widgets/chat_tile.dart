import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/chat.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final chat = chats[this.index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, right: 5.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Container(
            width: 50.0,
            height: 50.0,
            child: Image.network(chat.imageURL, fit: BoxFit.cover),
          ),
        ),
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
      ),
    );
  }
}
