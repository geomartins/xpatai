import 'package:flutter/material.dart';

class Keyboard {
  void removeFocus(context) {
    // FocusScopeNode currentFocus = FocusScope.of(context);
    // if (!currentFocus.hasPrimaryFocus) {
    //   currentFocus.unfocus();
    // }
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
