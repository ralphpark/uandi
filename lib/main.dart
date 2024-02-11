import 'package:flutter/material.dart';
import 'package:inflearn_cf_u_and_i/screen/home_screen.dart';

void main () {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80,
          ),
          displayMedium:TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w700
          ),

          ),
        ),
      home: HomeScreen(),
    ),
  );
}