import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTabButton extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  final String imagepath;
  final Color color;
  const CustomTabButton(
      {required this.onTap,
      required this.name,
      required this.imagepath,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              imagepath,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            Text(
              name,
              style: TextStyle(
                  color: color, fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        ));
  }
}
