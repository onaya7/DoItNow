import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:doitnow/utils/components/custom_tabbutton.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _auth = FirebaseAuthService();
  bool _isLoading = false;

  void _logoutUser() async {
    setState(() {
      _isLoading = !_isLoading;
    });
    await _auth.signOut();
    setState(() {
      _isLoading = !_isLoading;
    });
    mounted ? Navigator.pushReplacementNamed(context, '/welcome') : null;
  }

  void _unfocusLoader() {
    Navigator.pushReplacementNamed(context, '/todo');
  }

  @override
  Widget build(BuildContext context) {
    final UserData? user = Provider.of<UserData?>(context);
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.deepBlueColor,
            automaticallyImplyLeading: false,
            title: Text(' TODO APP',
                style: TextStyle(
                    color: ColorConstants.plainWhiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: ColorConstants.plainWhiteColor,
                  ),
                  onPressed: _logoutUser),
            ],
          ),
          body: Container(
              width: Constants.deviceMaxWidth(context),
              padding: const EdgeInsets.only(top: 22, left: 7, right: 7),
              color: ColorConstants.plainGreyColor,
              child: Column(
                children: <Widget>[
                  Card(
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
                  ),
                ],
              )),
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70.0)),
              onPressed: () => Navigator.pushNamed(context, '/addtodo'),
              backgroundColor: ColorConstants.deepBlueColor,
              child: Icon(
                Icons.add,
                color: ColorConstants.plainWhiteColor,
              ),
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
                        color: ColorConstants.deepBlueColor),
                    CustomTabButton(
                        name: 'Completed',
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/completedtodo'),
                        imagepath: 'assets/images/tick.svg',
                        color: ColorConstants.deepGreyColor),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (_isLoading) CustomLoader(unfocus: _unfocusLoader),
      ],
    );
  }
}
