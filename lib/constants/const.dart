import 'package:flutter/material.dart';

class Const{
  static const maincolor = Colors.lime;
  static const String Maintext = 'Restaurant App';
  static const String Maintext2 = 'Your Orders';
  // ignore: prefer_const_constructors
  static TextStyle get MainStyle => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900, 
    color: maincolor
  );
  static TextStyle get MainStyle2 => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900, 
    color: Colors.black,
  );
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static TextStyle get RunningStyle => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900, 
    color: maincolor
  );
  
}