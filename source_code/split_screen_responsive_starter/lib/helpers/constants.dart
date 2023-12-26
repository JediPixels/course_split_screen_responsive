import 'package:flutter/material.dart';
import 'package:responsive_adaptive_split_screen/pages/dashboard.dart';
import 'package:responsive_adaptive_split_screen/pages/User/user_grid.dart';
import 'package:responsive_adaptive_split_screen/pages/User/user_list.dart';

enum ResponsiveSizes {
  mobile,
  tablet,
  desktopWeb;

  // TODO: Add logic
  static ResponsiveSizes whichDevice() {
    return ResponsiveSizes.mobile;
  }
}

class Sizes {
  static const imageHeight = 580.0;
  static const iconLarge = 128.0;
  static const iconMedium = 38.0;
  static const iconSmall = 32.0;
  static const badgeLargeSize = 20.0;
  static const listWidth = 320.0;
  static const verticalDividerWidth = 1.0;
}

class SelectedPage {
  static final List<Widget> bodySelectedPage = <Widget>[
    const UserList(),
    const UserGrid(),
    const Dashboard(),
  ];

  static final List<Widget> bodySelectedPageSplitScreen = <Widget>[
    // TODO: add SplitScreen
    const UserGrid(),
    const Dashboard(),
  ];
}
