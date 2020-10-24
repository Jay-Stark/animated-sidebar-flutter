import 'package:animatedsidebar/sidebar/sideBarLayout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
    ),
    home: SideBarLayout(),
  ));
}