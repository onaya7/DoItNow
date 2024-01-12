import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_tabbutton.dart';
import 'package:flutter/material.dart';

class CompletedTodoPage extends StatelessWidget {
  const CompletedTodoPage({super.key});

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
                onPressed: () => Navigator.pushReplacementNamed(context, '/todo'),
              ),
            ),
            title: Text(' Completed Todo',
                style: TextStyle(
                    color: ColorConstants.plainWhiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
          body: Container(
            color: ColorConstants.plainGreyColor,
            child: Center(
              child: Text('Completed Todo Page ${DateTime.now()}'),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.all(0.0),
            color: ColorConstants.plainWhiteColor,
            child: SizedBox(
              height: 68.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTabButton(
                        name: 'All',
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/todo'),
                        imagepath: 'assets/images/playlist.svg',
                        color: ColorConstants.deepGreyColor),
                    CustomTabButton(
                        name: 'Completed',
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/completedtodo'),
                        imagepath: 'assets/images/tick.svg',
                        color: ColorConstants.deepBlueColor),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
