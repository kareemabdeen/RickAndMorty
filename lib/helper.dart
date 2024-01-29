import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
} // to access it context.screenHeight * n

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }
} // context.push(HomePage());
