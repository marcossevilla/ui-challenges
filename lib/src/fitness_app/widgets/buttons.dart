import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const SmallButton({
    Key key,
    this.backgroundColor,
    this.iconColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: 60,
        child: Icon(
          this.icon,
          color: this.iconColor,
        ),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color backgroundColor;

  const LargeButton({
    Key key,
    this.backgroundColor,
    this.textColor,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        label,
        style: TextStyle(
          color: this.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
      color: this.backgroundColor,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
