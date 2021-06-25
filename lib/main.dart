import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color.fromRGBO(2, 15, 31, 1),
          scaffoldBackgroundColor: Color.fromRGBO(2, 15, 31, 1)),
      home: InputPage(),
    );
  }
}
