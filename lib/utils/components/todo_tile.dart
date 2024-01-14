
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      color: ColorConstants.plainWhiteColor,
      child: SizedBox(
        height: 82,
        width: Constants.deviceMaxWidth(context),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 19, top: 22, right: 25, bottom: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('TODO TITLE',
                      style: TextStyle(
                          color: ColorConstants.deepBlueColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                  Text('TODO SUB TITLE',
                      style: TextStyle(
                          color: ColorConstants.deepBlackColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/edittodo'),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/pencil.svg',
                        colorFilter: ColorFilter.mode(
                            ColorConstants.iconColor,
                            BlendMode.srcATop),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/deletetodo'),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/trash.svg',
                        colorFilter: ColorFilter.mode(
                            ColorConstants.iconColor,
                            BlendMode.srcATop),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/completedtodo'),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/checkcircle.svg',
                        colorFilter: ColorFilter.mode(
                            ColorConstants.iconColor,
                            BlendMode.srcATop),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
