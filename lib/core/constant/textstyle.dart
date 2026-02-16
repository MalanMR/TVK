import 'package:flutter/material.dart';

class AppTextStyle{
  static const TextStyle heading = TextStyle(fontWeight: FontWeight.bold,fontSize: 26);
  static  TextStyle subheadingStyle(Color color){
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
  static final TextStyle bodyStyle = TextStyle(
    fontSize: 14.5,
    height: 1.6,
    color: Colors.grey[900],
  );
  static TextStyle detailcard(int size) {
    return TextStyle(
      fontSize: size.toDouble(),
      fontWeight: FontWeight.bold,
      fontFamily: 'PT Serif',
    );
  }

  static final TextStyle invoiceheading =  TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold);
}