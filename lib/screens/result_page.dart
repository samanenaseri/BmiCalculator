import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animator/animator.dart';
import 'package:bmi/component/box_icon.dart';
import 'package:bmi/component/shadow_on_boxes.dart';
import 'package:bmi/component/usable_card.dart';
import 'package:bmi/ui/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculate_bmi.dart';
class ResultCalculate extends StatefulWidget {
 // final IconData iconselected;
 final double CalculateBMI;
 final String RangeBMI;
 final String GetInterpretation;

  const ResultCalculate({this.CalculateBMI, this.RangeBMI, this.GetInterpretation});
  @override
  _ResultCalculateState createState() => _ResultCalculateState();
}

class _ResultCalculateState extends State<ResultCalculate> with SingleTickerProviderStateMixin{

   var bmiIcon;

  @override
  void initState() {
    // TODO: implement initState

    bmiIcon = widget.CalculateBMI;
  }
  bmiIconMake(){
    if(bmiIcon >30)
      return FaIcon(FontAwesomeIcons.solidSadTear,
        color: Color(0xffdbceea),
        size:75,
      );
    if(bmiIcon>=25 && bmiIcon <30)
      return FaIcon(FontAwesomeIcons.solidFrown,
          color: Color(0xffdbceea),
          size:75,
      );
    if(bmiIcon>=18.5 && bmiIcon<25)
      return FaIcon(FontAwesomeIcons.solidSmileBeam,
        color: Color(0xffdbceea),
          size:75,
      );
    if(bmiIcon<18.5)
      return FaIcon(FontAwesomeIcons.solidFrown,
        color: Color(0xffdbceea),
          size:75,
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d0438),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
           padding: EdgeInsets.only(top: 50,right: 30,left: 40,bottom: 10),
            child: Text('Result of Your Body BMI',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color:Color(0xffffffff),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1,1),
                  blurRadius: 10,
                  color:Color(0xffb68be3),
                )
              ]
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10.0,left: 10),
            child: UsabelCard(
              height: 400,
              width: 400,
              color:topContainer ,
              child: ShadowOnBoxes(
                bottom1: -80,
                left1: -500,
                height1: 800,
                width1: 800,
                firstColor: firstShadowColor,
                child: Column(
                  children: [
                  Container(
                    child:   Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Animator(
                        tween: Tween<double>(begin:1 *pi ,end: 4 *pi),
                        duration: Duration(seconds: 8),
                        repeats: 1,
                        curve: Curves.elasticOut,
                        cycles: 0,
                        builder: (_, animationState, __) =>Transform.rotate(
                            angle: animationState.value,
                        //alignment:  Alignment.bottomRight,
                          child:bmiIconMake() ,
                        )
                      )
                    ),
                  ),
                   SizedBox(height: 20,),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top:10.0),

                              child: SizedBox(
                                width: 250.0,
                                child: TypewriterAnimatedTextKit(
                                    totalRepeatCount:1,
                                  speed: Duration(milliseconds: 300),
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                  text: [
                                    "Your BMI Is:${widget.CalculateBMI.toString()}",

                                  ],
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top:35.0),

                              child: SizedBox(
                                width: 250.0,
                                child: ScaleAnimatedTextKit(
                                duration: Duration(seconds: 3),
                                 totalRepeatCount:1,

                                  text: [
                                    "${widget.RangeBMI.toString()}",
                                  ],
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22.0,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1,1),
                                          blurRadius: 10,
                                          color:Color(0xffb68be3),
                                        )
                                      ]
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left:10,right:20,top:30.0),

                              child: Text(widget.GetInterpretation.toString(),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  fontFamily: "Agne",
                                ),
                                  textAlign: TextAlign.center)
                          )
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
         // Spacer(),
          AnimatedButton(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            onPressed:() {
             Navigator.pop(context);
            },
            child: UsabelCard(
              color: topContainer,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ShadowOnBoxes(
                bottom1: -20,
                left1: -130,
                height1: 500,
                width1: 500,
                firstColor: firstShadowColor,
                child: Text(
                  'Recalculate',
                  style: TitleBox,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

}
