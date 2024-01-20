import 'dart:math';

import 'package:bmi/screens/score_screen.dart';
import 'package:bmi/widget/age_weight.dart';
import 'package:bmi/widget/gender_widget.dart';
import 'package:bmi/widget/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _gender = 0;
  int _height = 150;

  int _age = 30;
  int _weight = 50;

  bool _isFinished = false;
  double _bmiScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.blueAccent.shade400,
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Card(
            color: Colors.blueAccent.shade100,
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GenderWidget(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                HeightWidget(
                  onChange: (heightVal) {
                    _height = heightVal;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeightWidget(
                        onChange: (ageVal) {
                          _age = ageVal;
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 100),
                    AgeWeightWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: "Weight(Kgs)",
                        initValue: 50,
                        min: 0,
                        max: 300),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                    isFinished: _isFinished,
                    onFinish: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          child: ScoreScreen(
                            bmiScore: _bmiScore,
                            age: _age,
                          ),
                          type: PageTransitionType.fade,
                        ),
                      );
                      setState(() {
                        _isFinished = false;
                      });
                    },
                    onWaitingProcess: () {
                      calculatebmi();
                      //Calculate Bmi here
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _isFinished = true;
                        });
                      });
                    },
                    activeColor: Colors.blue,
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    buttonText: "Calculate",
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculatebmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
