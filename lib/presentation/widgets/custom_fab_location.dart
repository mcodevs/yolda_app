import 'package:flutter/material.dart';

class CustomFABLocation extends FloatingActionButtonLocation {
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
