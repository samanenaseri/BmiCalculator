import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmi/component/custom_clipper.dart';
import 'package:animator/animator.dart';
import 'package:google_fonts/google_fonts.dart';

class TopOfPage extends StatefulWidget {
  @override
  _TopOfPageState createState() => _TopOfPageState();
}

class _TopOfPageState extends State<TopOfPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Stack(
          children: <Widget>[ //stack overlaps widgets
            Opacity( //semi red clippath with more height and with 0.5 opacity
              opacity: 0.4,
              child: ClipPath(
                clipper:CustomClipperShape(), //set our custom wave clipper
                child:Container(
                  color:topContainer,
                  height:150,
                ),
              ),
            ),
            Opacity( //semi red clippath with more height and with 0.5 opacity
              opacity: 0.2,
              child: ClipPath(
                clipper:CustomClipperShape(), //set our custom wave clipper
                child:Container(
                  color:topContainer,
                  height:160,
                ),
              ),
            ),
            ClipPath(  //upper clippath with less height
              clipper:CustomClipperShape(), //set our custom wave clipper.
              child:Container(
                padding: EdgeInsets.only(bottom: 50),
                color:topContainer,
                height:140,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left:60.0,top: 30),
                  child: ColorizeAnimatedTextKit(
                      repeatForever: true,
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "BMI Health Care",

                      ],
                      textStyle: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "Horizon",
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600

                      ),
                      colors: [
                        // Color(0xfff037cb),
                        Color(0xffc263d3),
                        Color(0xffa078ce),
                        Color(0xffd7c8e9),
                      ],
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ),

              ),
            ),
            Positioned(
              top: 55.0,
              left: 45,
              child:  Animator(
                tween: Tween<double>(begin: 1.9, end: 2.1),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 700),
                cycles:0 ,
                repeats:0,
                builder: (_, animationState, __) => Transform.scale(
                  scale: animationState.value,
                  child: Container(
                    decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,-2),
                              color: Colors.black87,
                              blurRadius: 15,
                              spreadRadius: -7
                          )
                        ]
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Color(0xffc264d3),
                      size: 50,
                    ),
                  ),
                ),
              ),),
//        Positioned(
//          top: 77.0,
//          left: 70,
//          child:  Animator(
//            tween: Tween<double>(begin: 2.3, end: 2.6),
//            curve: Curves.fastOutSlowIn,
//            duration: Duration(milliseconds: 700),
//            cycles:0 ,
//            repeats:0,
//            builder: (_, animationState, __) => Transform.scale(
//              scale: animationState.value,
//              child:Text('BMi',
//              style: TextStyle(
//                color: Colors.white70,
//                fontWeight: FontWeight.bold
//              )),
//            ),
//          ),)

          ],)
    );
  }
}


