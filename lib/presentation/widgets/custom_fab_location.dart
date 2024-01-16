import 'package:flutter/material.dart';

class CustomFABLocation extends FloatingActionButtonLocation {
  const CustomFABLocation();
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(
        0,
        scaffoldGeometry.scaffoldSize.height -
            scaffoldGeometry.floatingActionButtonSize.height -
            scaffoldGeometry.minInsets.bottom -
            30);
  }
}
