import 'dart:ui';

import 'package:calculator_bmi/bmi_brain.dart';
import 'package:calculator_bmi/customWidgets.dart';
import 'package:calculator_bmi/input_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    double bmi = Calculator(height: height, weight: weight).calculateBMI();
    return Scaffold(
      appBar: AppBar(
        title: Text('CACULATED BMI'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Your Result',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
            SizedBox(height: 20),
            Expanded(
              child: CustomCard(
                cardChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          Calculator(height: height, weight: weight)
                              .getResult(bmi),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 90,
                              letterSpacing: 0.6),
                        ),
                        Flexible(
                          child: Container(
                            width: 300,
                            child: Text(
                              Calculator(height: height, weight: weight)
                                  .getFeedback(bmi),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  letterSpacing: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onPress: () {},
              ),
            ),
            BottomButton(
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              text: 'RE-CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
