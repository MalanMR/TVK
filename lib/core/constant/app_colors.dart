import 'package:flutter/material.dart';

class AppColors {
  static const brown = Color(0XFF2c1507);
  static const browncard = Color(0XFF2c1507);

  static const background = Color(0xFFf1f1f1);
  static const primary = Color(0xFF1E88E5);
  static const accent = Color(0xFFFDD835);
  static const textGrey = Color(0xFF9E9E9E);
  static final  tealColor = Colors.teal[300];

  static Color getOptionColor(int index, String crtAns, String stdAns) {
    if (index.toString() == crtAns) {
      return Colors.green.withOpacity(0.2);
    } else if (index.toString() == stdAns && stdAns != crtAns) {
      return Colors.red.withOpacity(0.2);
    }
    return Colors.grey.withOpacity(0.1);
  }
  static  Color getStatusColor(String status) {
    switch (status) {
      case "0":
        return Colors.red;
      case "1":
        return Colors.green;
      case "2":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

}
