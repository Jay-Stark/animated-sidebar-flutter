import 'dart:async';

import 'package:animatedsidebar/bloc_navigation_bloc/NavigationBloc.dart';
import 'package:animatedsidebar/sidebar/menuItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  // ignore: close_sinks
  StreamSink<bool> isSideBarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
  }

  void onIConPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: 300,
                color: Color(0xFF262AAA),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    ListTile(
                      title: Text(
                        "Dastan",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      subtitle: Text("Padmapanipatra@gmail.com",
                          style: TextStyle(
                              color: const Color(0xFF1BB5FD), fontSize: 15)),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItems(
                      icon: Icons.home,
                      title: "Home",
                      onTap: () {
                        onIConPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickEvent);
                      },
                    ),
                    MenuItems(
                      icon: Icons.person,
                      title: "My Account",
                      onTap: () {
                        onIConPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickEvent);
                      },
                    ),
                    MenuItems(
                      icon: Icons.shopping_basket,
                      title: "My Orders",
                      onTap: () {
                        onIConPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickEvent);
                      },
                    ),
                    MenuItems(
                      icon: Icons.card_giftcard,
                      title: "My Wishlist",
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItems(
                      icon: Icons.settings,
                      title: "Setting",
                    ),
                    MenuItems(
                      icon: Icons.exit_to_app,
                      title: "Logout",
                    ),
                  ],
                ),
              )),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIConPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 25,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(0xFF262AAA),
                      ),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(0xFF1BB5FD)),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.quadraticBezierTo(0, 3, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 3, 0, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
