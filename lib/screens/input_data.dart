import 'package:bmi/component/box_icon.dart';
import 'package:bmi/component/rounded-icon.dart';
import 'package:bmi/component/shadow_on_boxes.dart';
import 'package:bmi/component/usable_card.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:bmi/screens/top_of_page.dart';
import 'package:bmi/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_button/animated_button.dart';

import '../calculate_bmi.dart';

enum Gender {
  Male,
  Female,
  notSelected,
}

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData>
    with SingleTickerProviderStateMixin {
  Gender selectedGender = Gender.notSelected;
  int height = 180;
  double minHeight = 100;
  double maxHeight = 250;
  int weight = 30;
  int minWeight = 15;
  int maxWeight = 100;
  int age = 20;
  AnimationController _animationController;
  Animation _animationmale;
  Animation _textAnimation;
  CalculateBmiAdult calc;
  Map<String,IconData> icons={

    '1':FontAwesomeIcons.solidSadTear,
    '2':FontAwesomeIcons.solidSadTear,
    '3':FontAwesomeIcons.solidSmileBeam,
    '4':FontAwesomeIcons.solidSadTear,
  };


  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _animationmale = Tween(begin: 45.0, end: 50.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    _textAnimation = Tween(begin: 20.0, end: 22.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopOfPage(),
            // SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                    child: UsabelCard(
                  width: 100,
                  height: 100,
                  color: topContainer,
                  onPressed: () {
                    if (selectedGender == Gender.notSelected ||
                        selectedGender == Gender.Female) {
                      _animationController.reset();
                      if (_animationController.isCompleted) {
                        _animationController.reverse();
                        return;
                      }
                      if (_animationController.isAnimating) {}
                      _animationController.forward();
                    }
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  child: ShadowOnBoxes(
                      bottom1: -5,
                      left1: -65,
                      height1: 200,
                      width1: 200,
                      firstColor: firstShadowColor,
                      child: selectedGender == Gender.Male
                          ? BoxIcons(
                              icon: FontAwesomeIcons.male,
                              //color: Colors.red,
                              //height: 100,
                              label: 'Male',
                              fontsize: _textAnimation.value,
                              size: _animationmale.value,
                            )
                          : BoxIcons(
                              icon: FontAwesomeIcons.male,
                              //color: Colors.red,
                              //height: 100,
                              label: 'Male',
                              fontsize: 20,
                              size: 45,
                            )),
                )),
                Expanded(
                    child: UsabelCard(
                  width: 100,
                  height: 100,
                  color: topContainer,
                  onPressed: () {
                    if (selectedGender == Gender.notSelected ||
                        selectedGender == Gender.Male) {
                      _animationController.reset();
                      if (_animationController.isCompleted) {
                        _animationController.reverse();

                        return;
                      }
                      if (_animationController.isAnimating) {
                        _animationController.reverse();
                      }
                      _animationController.forward();
                    }
                    setState(() {
                      selectedGender = Gender.Female;
                      //click = 2;
                    });
                  },
                  child: ShadowOnBoxes(
                      bottom1: -5,
                      left1: -65,
                      height1: 200,
                      width1: 200,
                      firstColor: firstShadowColor,
                      child: selectedGender == Gender.Female
                          ? BoxIcons(
                              icon: FontAwesomeIcons.female,
                              //color: Colors.red,
                              //height: 100,
                              label: 'Female',
                              fontsize: _textAnimation.value,
                              size: _animationmale.value,
                            )
                          : BoxIcons(
                              icon: FontAwesomeIcons.female,
                              //color: Colors.red,
                              //height: 100,
                              label: 'Female',
                              fontsize: 20,
                              size: 45,
                            )),
                )),
              ],
            ),
            //  SizedBox(height: 10,),
            UsabelCard(
              height: 130,
              width: 250,
              color: topContainer,
              child: ShadowOnBoxes(
                bottom1: -20,
                left1: -130,
                height1: 500,
                width1: 500,
                firstColor: firstShadowColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TitleBox,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: TextHeight),
                        Text(
                          'cm',
                          style: TextBox,
                        )
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            thumbColor: Color(0xffc263d3),
                            overlayColor: Color(0x92c263d3),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbShape: RoundSliderThumbShape(
                                disabledThumbRadius: 15.0)),
                        child: Slider(
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                          max: maxHeight,
                          min: minHeight,
                          value: height.toDouble(),
                        ))
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: UsabelCard(
                    height: 130,
                    width: 350,
                    color: topContainer,
                    child: ShadowOnBoxes(
                      bottom1: -20,
                      left1: -190,
                      height1: 400,
                      width1: 400,
                      firstColor: firstShadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TitleBox,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: TextHeight,
                              ),
                              Text(
                                'kg',
                                style: TextBox,
                              )
                            ],
                          ),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.grey,
                                thumbColor: Color(0xffc263d3),
                                overlayColor: Color(0x92c263d3),
                                thumbShape: RoundSliderThumbShape(
                                    disabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                              ),
                              child: Slider(
                                value: weight.toDouble(),
                                onChanged: (double value) {
                                  setState(() {
                                    weight = value.round();
                                  });
                                },
                                min: minWeight.toDouble(),
                                max: maxWeight.toDouble(),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: UsabelCard(
                    height: 130,
                    width: 200,
                    color: topContainer,
                    child: ShadowOnBoxes(
                      bottom1: -20,
                      left1: -180,
                      height1: 300,
                      width1: 300,
                      firstColor: firstShadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TitleBox,
                          ),
                          Text(
                            age.toString(),
                            style: TextHeight,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundedIconsButtons(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              RoundedIconsButtons(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            AnimatedButton(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              onPressed:() {
                calc = CalculateBmiAdult(height: height.toDouble(),weight: weight.toDouble());
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultCalculate(
                     // iconselected: calc.IconMaking,
                      CalculateBMI: calc.CalculateBMI(),
                      RangeBMI: calc.RangeBMI(),
                      GetInterpretation: calc.GetInterpretation(),
                  );
                }));
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
                    'Calculate BMI',
                    style: TitleBox,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
