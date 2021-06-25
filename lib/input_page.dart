import 'package:calculator_bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'customWidgets.dart';
import 'constants.dart';

enum Gender { male, female, Null }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveColor;
  Color femaleCardColor = inActiveColor;
  Gender selectedGender = Gender.Null;
  int _currentSliderValue = 30;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CustomCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: CardWidget(
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inActiveColor,
                    text: "MALE",
                    icon: Icon(
                      FontAwesomeIcons.mars,
                      color: selectedGender == Gender.male
                          ? activeColor
                          : inActiveColor,
                      size: 60,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: CardWidget(
                    color: selectedGender == Gender.female
                        ? activeColor
                        : inActiveColor,
                    text: "FEMALE",
                    icon: Icon(
                      FontAwesomeIcons.venus,
                      color: selectedGender == Gender.female
                          ? activeColor
                          : inActiveColor,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    onPress: () {},
                    cardChild: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'HEIGHT',
                            style: labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                _currentSliderValue.toString(),
                                style: numberStyle,
                              ),
                              Text(
                                'cm',
                                style: labelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: bottomButtonColor,
                            ),
                            child: Slider(
                              value: _currentSliderValue.toDouble(),
                              min: 30,
                              max: 250,
                              activeColor: bottomButtonColor,
                              inactiveColor: inActiveColor,
                              onChanged: (double newValue) {
                                setState(() {
                                  _currentSliderValue = newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CustomCard(
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: numberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularButton(
                            icon: Icons.remove,
                            onLongPress: () {
                              setState(() {
                                weight > 0 ? weight-- : weight = 0;
                              });
                            },
                            onPress: () {
                              setState(() {
                                weight > 0 ? weight-- : weight = 0;
                              });
                            },
                          ),
                          Expanded(
                            child: CircularButton(
                              icon: Icons.add_circle,
                              onLongPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularButton(
                            icon: Icons.remove,
                            onLongPress: () {
                              setState(() {
                                age > 0 ? age-- : age = 0;
                              });
                            },
                            onPress: () {
                              setState(() {
                                age > 0 ? age-- : age = 0;
                              });
                            },
                          ),
                          Expanded(
                            child: CircularButton(
                              icon: Icons.add_circle,
                              onLongPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          height: _currentSliderValue, weight: weight)));
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
