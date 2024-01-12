import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final void Function()? unfocus;

  const CustomLoader({
    required this.unfocus,
    super.key,
  });

  void unfocusLoader(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/todo');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocus,
      child: Container(
        color: Colors.black
            .withOpacity(0.5), // Optional: adds a slight dark overlay
        child: Center(
          child: Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: ColorConstants.deepBlueColor,
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
