import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.deepBlueColor,
            leading: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstants.plainWhiteColor,
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/todo'))),
            title: Text(' Add Task',
                style: TextStyle(
                    color: ColorConstants.plainWhiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
          body: Container(
            color: ColorConstants.plainGreyColor,
            child: const Center(
              child: Text('Add Task'),
            ),
          ),
        ),
      ],
    );
  }
}
