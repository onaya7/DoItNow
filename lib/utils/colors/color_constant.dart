import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color deepBlueColor = hexToColor('#575DFB');
  static Color deepBlackColor = hexToColor('#1C1C1C');
  static Color deepGreyColor = hexToColor('#CC222222');
  static Color deepRedColor = hexToColor('#D6D7EF');
  static Color plainWhiteColor = hexToColor('#FFFFFF');
  static Color plainBlackColor = hexToColor('#000000');
  static Color plainGreyColor = hexToColor('#D6D7EF');

  static Color lightGreyColor = hexToColor('#C8C8C8');
}
