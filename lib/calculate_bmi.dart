import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

class CalculateBmiAdult{
  final double height;
  final double weight;
 // final IconData icon;

  double bmi;

  CalculateBmiAdult({this.height, this.weight});

  double CalculateBMI(){
    bmi = weight / pow(height/100, 2);
    return double.parse(bmi.toStringAsFixed(1));
  }
  String RangeBMI(){
    if(bmi>30)
      return 'OBESE';
    if(bmi>=25 && bmi <30)
      return 'OVERWEIGHT';
    if(bmi>=18.5 && bmi<25)
      return 'NORMAL';
    if(bmi<18.5)
      return 'UNDERWEIGHT';
  }
  String GetInterpretation(){
    if(bmi>30)
      return 'Be Careful!Being OBESE increases the risk of a number of serious diseases and health conditions.Try exercise and eat less';
    if(bmi>=25  && bmi <30)
      return 'Be Careful!Being OVERWEIGHT increases the risk of a number of serious diseases and health conditions.Try exercise more and eat less';
    if(bmi>=18.5 && bmi<25)
      return 'Good Job ! You Have a Normal Body';
    if(bmi<18.5)
      return 'Be Aware!Being underweight has its own associated risks';
  }
  String IconMaking(){
    var faicon;
    if(bmi>30){
       faicon=FaIcon(FontAwesomeIcons.solidSadTear);
      return faicon.toString();
    }
    if(bmi>=25 && bmi <30)
    {
       faicon=FaIcon(FontAwesomeIcons.solidSadTear);
      return faicon.toString();
    }
    if(bmi>=18.5 && bmi<25)
    if(bmi<18.5)
      {
       faicon=FaIcon(FontAwesomeIcons.solidSmileBeam);
      return faicon.toString();
      }

  }


}
