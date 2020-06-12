import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../colors.dart';
import '../models/chat.dart';
import '../widgets/internet_image.dart';
import '../widgets/input_decoration.dart';

final math.Random _random = math.Random();

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kdarkGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SlideInUp(child: _Card()),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: kGreenyWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          _Title(),
          SizedBox(height: 10.0),
          _Messages(),
          _BottomBar(),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 30.0,
        left: 20.0,
        right: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextFormField(decoration: inputDecoration()),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            child: Icon(Icons.send),
            elevation: 0.0,
            onPressed: () {},
            backgroundColor: kShinyGreen,
          )
        ],
      ),
    );
  }
}

class _Messages extends StatelessWidget {
  const _Messages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        itemCount: conversation.length,
        itemBuilder: (context, i) {
          return _Message(index: i);
        },
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final message = conversation[index];
    final bool isMe = message.sender == 'Me';

    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isMe) InternetImage(url: message.imageURL),
          if (isMe) _MessageTime(message: message.time),
          if (isMe) _MessageCheck(),
          _MessageBubble(message: message),
          if (isMe) InternetImage(url: message.imageURL),
          if (!isMe) _MessageTime(message: message.time),
          if (!isMe) _MessageCheck(),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({Key key, @required this.message}) : super(key: key);

  final Chat message;

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.sender == 'Me';
    final bool isImage = message.imageMessageURL.isNotEmpty;

    return Container(
      width: 220,
      margin: const EdgeInsets.all(8.0),
      padding: isImage ? null : const EdgeInsets.all(15.0),
      child: _MessageContent(message: message),
      decoration: BoxDecoration(
        color: isMe ? Colors.white : kShinyGreen,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
      ),
    );
  }
}

class _MessageContent extends StatelessWidget {
  const _MessageContent({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Chat message;

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.sender == 'Me';
    final bool isVoice = message.isVoice;
    final bool isImage = message.imageMessageURL.isNotEmpty;

    if (isVoice) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.playCircle,
            color: isMe ? kShinyGreen : Colors.white,
          ),
          SizedBox(width: 10.0),
          for (int i = 0; i < 35; i++)
            Container(
              margin: const EdgeInsets.only(right: 2.0),
              width: 2,
              height: (10 + _random.nextInt(25 - 10)).toDouble(),
              color: isMe ? kShinyGreen : Colors.white,
            ),
        ],
      );
    } else if (isImage) {
      return ClipRRect(
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
        child: CachedNetworkImage(imageUrl: message.imageMessageURL),
      );
    } else {
      return Text(
        message.message,
        style: TextStyle(
          fontSize: 13.0,
          color: isMe ? kShinyGreen : Colors.white,
        ),
      );
    }
  }
}

class _MessageCheck extends StatelessWidget {
  const _MessageCheck({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.checkDouble,
      color: kShinyGreen,
      size: 15.0,
    );
  }
}

class _MessageTime extends StatelessWidget {
  const _MessageTime({Key key, @required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        this.message,
        style: TextStyle(fontSize: 11.0, color: kShinyGreen),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Matt Champion',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        Text(
          'Was online 42 minutes ago',
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
