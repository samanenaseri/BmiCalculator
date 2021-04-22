import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class animationTest extends StatefulWidget {
  @override
  _animationTestState createState() => _animationTestState();
}

class _animationTestState extends State<animationTest> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation sizeanimation;
  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    sizeanimation = Tween(begin: 100.0,end: 150.0).animate(CurvedAnimation(parent: animationController,curve: Curves.fastOutSlowIn))..addListener((){
//      if(animationController.isCompleted){
//        animationController.reverse();
//        return;
//      }
//      animationController.forward();
      setState(() {

      });
    });
   print('run');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          new Container(width: double.infinity,margin: EdgeInsets.only(top: 50),),
    FaIcon(
    FontAwesomeIcons.male,
    color: Colors.red,
    //height: 100,
    size: sizeanimation.value,
  ),
  MaterialButton(
      onPressed: (){

      if(animationController.isCompleted){
        animationController.reverse();
        return;
      }
      animationController.forward();
    },
//  setState(() {
//
//  });
      child:Text('test'))
          ]
      )

    );
  }
}
