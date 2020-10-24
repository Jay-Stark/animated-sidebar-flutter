import 'package:animatedsidebar/bloc_navigation_bloc/NavigationBloc.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Orders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, )),
    );
  }
}
