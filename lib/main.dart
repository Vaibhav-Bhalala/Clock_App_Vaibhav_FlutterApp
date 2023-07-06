

import 'package:clock_app/Strap_Watch.dart';
import 'package:clock_app/screens/Analog_watch.dart';
import 'package:clock_app/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.red),
    routes: {
      '/': (context) => StrapWatch(),
      'HomePage': (context) => HomePage(),
      'AnalogWatch': (context) => AnalogWatch(),
    },
  ));
}

