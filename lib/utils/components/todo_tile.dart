import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final String description;
  final bool todoStatus;
  final void Function()? isCompleted;
  final void Function()? editTodo;
  final void Function()? deleteTodo;

  const TodoTile({
    required this.title,
    required this.description,
    required this.todoStatus,
    this.isCompleted,
    this.editTodo,
    this.deleteTodo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: ColorConstants.plainWhiteColor,
      child: SizedBox(
        height: 82,
        width: Constants.deviceMaxWidth(context),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 19, top: 22, right: 25, bottom: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          decoration: todoStatus
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: ColorConstants.deepBlueColor,
                          color: ColorConstants.deepBlueColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                  Text(description,
                      style: TextStyle(
                          decoration: todoStatus
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: ColorConstants.deepBlueColor,
                          color: ColorConstants.deepBlackColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: editTodo,
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/pencil.svg',
                        colorFilter: ColorFilter.mode(
                            todoStatus
                                ? ColorConstants.iconColor
                                : ColorConstants.deepBlueColor,
                            BlendMode.srcATop),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: deleteTodo,
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/trash.svg',
                        colorFilter: ColorFilter.mode(
                            todoStatus
                                ? ColorConstants.iconColor
                                : ColorConstants.deepBlueColor,
                            BlendMode.srcATop),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: isCompleted,
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/checkcircle.svg',
                        colorFilter: todoStatus
                            ? ColorFilter.mode(
                                ColorConstants.deepBlueColor, BlendMode.srcATop)
                            : ColorFilter.mode(
                                ColorConstants.iconColor, BlendMode.srcATop),
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
