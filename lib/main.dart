import 'package:flutter/material.dart';
import 'package:klock/pages/choose_location.dart';
import 'package:klock/pages/home.dart';
import 'package:klock/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Main(),
      '/location': (context) => ChooseLocation()
    },

  ));
}
