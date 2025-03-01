import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

// custom context
final customContext = navigationKey.currentState!.context;

// Sizes
final sizeWidth = MediaQuery.sizeOf(customContext).width;
final sizeHeight = MediaQuery.sizeOf(customContext).height;


// Spacer
const spaceHeight20 = SizedBox(
  height: 20,
);

const spaceHeight10 = SizedBox(
  height: 10,
);

const spaceWidth10 = SizedBox(
  width: 10,
);

const spaceWidth20 = SizedBox(
  width: 20,
);
