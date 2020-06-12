import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';

inputDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: kShinyGreen,
    prefixIcon: Icon(
      FontAwesomeIcons.smile,
      color: Colors.white,
    ),
    suffixIcon: Icon(
      FontAwesomeIcons.share,
      color: Colors.white,
    ),
    enabledBorder: outlineBorder(),
    focusedErrorBorder: outlineBorder(),
    disabledBorder: outlineBorder(),
    focusedBorder: outlineBorder(),
    errorBorder: outlineBorder(),
  );
}

OutlineInputBorder outlineBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 0.0),
    borderRadius: BorderRadius.circular(20.0),
  );
}
