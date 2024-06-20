// responsive_helper.dart
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getFontSize(BuildContext context, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return fontSize - 10; // Decrease font size for smaller screens
    } else {
      return fontSize;
    }
  }

  static double getSpacing(BuildContext context, double spacing) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return spacing - 10; // Decrease spacing for smaller screens
    } else {
      return spacing;
    }
  }
}
