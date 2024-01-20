import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';


class ScoreScreen extends StatelessWidget {

  final double bmiScore;

  final int age;

  String? bmiStatus;
  String? bmiInterpretation;

  Color? bmiStatusColor;

   ScoreScreen({super.key, required this.bmiScore, required this.age});

  @override
  Widget build(BuildContext context) {
    setBMIInterpretation();
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.blueAccent.shade400,
        centerTitle: true,
        title:const Text("BMI Score",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Container(

        padding: EdgeInsets.all(12),
    child: Card(
    elevation: 12,
    shape: const RoundedRectangleBorder(

    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Your Score",style: TextStyle(fontSize: 30,color: Colors.blue),),
      const SizedBox(
        height: 10,
      ),
      PrettyGauge(
        gaugeSize: 300,
        maxValue: 40,
        minValue: 0,
        segments: [
          GaugeSegment('UnderWeight', 18.5, Colors.red),
          GaugeSegment('Normal', 6.4, Colors.green),
          GaugeSegment('OverWeight', 5, Colors.orange),
          GaugeSegment('Obese', 10.1, Colors.pinkAccent.shade400)

        ],
        valueWidget: Text(bmiScore.toStringAsFixed(1),
          style:const  TextStyle(fontSize: 40,),

        ),
        currentValue: bmiScore.toDouble(),
        needleColor: Colors.blueAccent,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        bmiStatus!, style: TextStyle(
        fontSize: 20,
        color: bmiStatusColor!
      ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        bmiInterpretation!, style: TextStyle(
          fontSize: 15,
          color: bmiStatusColor!
      ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child:const  Text("Re-Calculate")),
            ),
            const SizedBox(
              width: 10,
            ),

          ],
        ),
      )

    ],
    ))));
  }
  void setBMIInterpretation(){
    if(bmiScore>30){
      bmiStatus="Obese";
      bmiInterpretation="Please work out to reduce obesity";
      bmiStatusColor=Colors.pinkAccent;
    }
   else  if(bmiScore>=25){
      bmiStatus="OverWeight";
      bmiInterpretation="Do regular Exercise and reduce weight";
      bmiStatusColor=Colors.orange;
    }
    else  if(bmiScore>=18.5){
      bmiStatus="Normal ";
      bmiInterpretation="Enjoy, You are fit";
      bmiStatusColor=Colors.green;
    }
    else  if(bmiScore<18.5){
      bmiStatus="UnderWeight";
      bmiInterpretation="East More";
      bmiStatusColor=Colors.red;
    }
  }
}
