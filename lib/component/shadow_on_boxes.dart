import 'package:flutter/material.dart';

import 'box_icon.dart';
class ShadowOnBoxes extends StatefulWidget {
  final double height1;
  final double width1;
  final double height2;
  final double width2;
  final double top1;
  final double right1;
  final double bottom1;
  final double left1;
  final double top2;
  final double right2;
  final double bottom2;
  final double left2;
  final Widget child;
  final Color firstColor;
  final Color secondcolor;

  const ShadowOnBoxes({this.height1, this.width1,this.height2, this.width2, this.top1, this.right1, this.bottom1, this.left1,
    this.top2, this.right2, this.bottom2, this.left2, this.firstColor, this.secondcolor, this.child});

  @override
  _ShadowOnBoxesState createState() => _ShadowOnBoxesState();
}

class _ShadowOnBoxesState extends State<ShadowOnBoxes> {
  @override
  Widget build(BuildContext context) {
    return  ClipRRect( //to clip overflown positioned containers.
      borderRadius: BorderRadius.circular(15),
      //if we set border radius on container, the overflown content get displayed at corner.
      child:Container(

          child: Stack(
            children: <Widget>[ //Stack helps to overlap widgets
            Positioned( //positioned helps to position widget wherever we want.
                bottom:widget.bottom1,
                left:widget.left1,
                top: widget.top1,
                right: widget.right1,//position of the widget
                child:Container(
                    height:widget.height1,
                    width:widget.width1,
                    decoration:BoxDecoration(
                        shape:BoxShape.circle,
                        color:widget.firstColor //background color with opacity
                    )
                )
            ),
//            Positioned(
//                left:widget.left2,
//                top:widget.top2,
//                bottom: widget.bottom2,
//                right: widget.right2,
//                child:Container(
//                    height:widget.height2,
//                    width:widget.width2,
//                    decoration:BoxDecoration(
//                        shape:BoxShape.circle,
//                        color:widget.secondcolor
//                    )
//                )
//            ),

            Positioned(  //main content container postition.
              child: Container(
                padding: EdgeInsets.all(10),
                height:widget.height1,
                alignment: Alignment.center,
                child:widget.child,
              ),
            )
          ],)
      ),
    );
  }
}
