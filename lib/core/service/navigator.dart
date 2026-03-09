import 'package:flutter/material.dart';

class CustomNavigator {
  void push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
