import 'package:animatedsidebar/bloc_navigation_bloc/NavigationBloc.dart';
import 'package:animatedsidebar/pages/HomePage.dart';
import 'package:animatedsidebar/pages/myAccountsPage.dart';
import 'package:animatedsidebar/pages/myOrders.dart';
import 'package:animatedsidebar/sidebar/SideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  return navigationState as Widget;
                }
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
