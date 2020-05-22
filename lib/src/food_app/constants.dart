import 'dart:ui';

import 'package:flutter/material.dart';

final Color kPrimaryColor = Colors.orange[600];
const Color kSecondaryColor = Color.fromRGBO(214, 242, 242, 1);

final BoxDecoration shadedDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      offset: Offset(0.0, 1.0),
      blurRadius: 4.0,
    ),
  ],
);
