import 'package:bmi/component/shadow_on_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsabelCard extends StatefulWidget {
   final Function onPressed;
   final Color color;
   final Widget child;
   final double height;
   final double width;


  const UsabelCard({this.onPressed, this.color, this.child,this.height, this.width});
  @override
  _UsabelCardState createState() => _UsabelCardState();
}

class _UsabelCardState extends State<UsabelCard> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      child:  Container(
        height: widget.height,
        width: widget.width,
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration( //decoration for the outer wrapper
          color: widget.color,
          borderRadius: BorderRadius.circular(15), //border radius exactly to ClipRRect
          boxShadow:[
            BoxShadow(
              color: Colors.black12, //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ) ,
        child:widget.child,
      ),
       onTap: widget.onPressed,
    );
  }
}