import 'package:flutter/material.dart';

const bigTitleTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

final smallTitleTextStyle = TextStyle(
  color: Colors.black.withOpacity(0.5),
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

const infoTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 14,
);

// borderStyle
const borderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(color: Colors.black, width: 0.5),
);
