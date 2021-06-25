import 'dart:ui';

import 'constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget cardChild;
  final void Function() onPress;

  CustomCard({required this.cardChild, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        height: 150,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(29, 31, 50, 1),
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 3.0)),
        ]),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  BottomButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 19, letterSpacing: 1),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: bottomButtonColor,
        ),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;

  CardWidget({required this.text, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, color: color),
        )
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPress;
  final void Function() onLongPress;

  CircularButton(
      {required this.icon, required this.onPress, required this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onLongPress: onLongPress,
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.white70,
        size: 50.0,
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(), primary: Color.fromRGBO(26, 29, 44, 255)),
    );
  }
}
