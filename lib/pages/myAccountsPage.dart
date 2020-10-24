import 'package:animatedsidebar/bloc_navigation_bloc/NavigationBloc.dart';
import 'package:flutter/material.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Accounts Page", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, )),
    );
  }
}
