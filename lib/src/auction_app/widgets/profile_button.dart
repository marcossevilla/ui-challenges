import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            FontAwesomeIcons.freeCodeCamp,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: -2,
          left: -2,
          child: Container(
            width: 15.0,
            height: 15.0,
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
