import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItems({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.cyan,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}
