import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/welcome/welcome_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        "/home_screen": (_) => new HomeScreen(),
      },
    );
  }
}

