import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../screens/card_detail.dart';

class BankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CardDetailScreen()),
          ),
          child: Card(
            elevation: 6.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: kPinkyPurple,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.ccVisa,
                    color: Colors.white,
                    size: 45.0,
                  ),
                  Text(
                    '1234 5678 9890 1244',
                    style: TextStyle(color: Colors.white, letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: DottedBorder(
          dashPattern: [4, 4],
          color: kNeonAqua,
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: Radius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 60.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.plus, color: kNeonAqua, size: 45.0),
                SizedBox(height: 5.0),
                Text(
                  'Add',
                  style: TextStyle(
                    color: kNeonAqua,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
