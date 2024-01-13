import 'package:flutter/material.dart';

class Controller {
  static void shiftFocus(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (nextFocus != null) {
      currentFocus?.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    } else {
      currentFocus?.unfocus();
    }
  }
}
