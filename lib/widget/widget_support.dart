import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle HandleTextFeildStyle() {
    return TextStyle(
      fontSize: 24,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle LightTextFeildStyle() {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
       color: Colors.black54,
    );
  }
    static TextStyle semiBoldTextFeildStyle() {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'Poppin',
      fontWeight: FontWeight.w500,
      color:  Colors.black,
    );
  }
}
