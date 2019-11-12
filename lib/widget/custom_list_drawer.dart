import 'package:flutter/material.dart';

class ButtonDrawerList extends StatelessWidget {
  Function onTap;
  IconData icon;
  String dTitle;
  ButtonDrawerList({this.onTap, this.icon, this.dTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.all(14.0),
            child: Icon(
              icon,
              size: 30.0,
              color: Colors.deepOrange,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(dTitle,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.brown,
                      fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
