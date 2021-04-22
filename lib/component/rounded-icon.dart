import 'package:flutter/material.dart';
  class RoundedIconsButtons extends StatefulWidget {
  final IconData icon;
  final Function onPressed;
  const RoundedIconsButtons({this.icon, this.onPressed});
    @override
    _RoundedIconsButtonsState createState() => _RoundedIconsButtonsState();
  }

  class _RoundedIconsButtonsState extends State<RoundedIconsButtons> {
    @override
    Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(7.0),
       child: Icon(widget.icon,
        color: Colors.white,
         size: 30.0,
       ),
        elevation:2.0 ,
        shape:CircleBorder(),
        hoverColor: Color(0xffd7c8e9),
        fillColor: Color(0xffa078ce),
        //splashColor: Color(0xffc263d3),
        constraints:  BoxConstraints(
            minWidth: 40.0,
            minHeight: 40.0),

        onPressed: widget.onPressed);

    }
  }

