import 'package:doitnow/data/todo_item.dart';
import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/services/hiveservice.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:doitnow/utils/components/custom_tabbutton.dart';
import 'package:doitnow/utils/components/todo_tile.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _auth = FirebaseAuthService();
  late Box<TodoItem> _todoBox;

  bool _isLoading = false;
  bool done = false;

  @override
  void initState() {
    super.initState();
    _todoBox = HiveService.todoBox;
  }

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

  _isCompleted(int index, TodoItem todo) async {
    setState(() {
      _isLoading = !_isLoading;
    });
    todo.isCompleted = !todo.isCompleted;

    await HiveService.updateIsCompleted(index, todo.isCompleted);
    debugPrint('completed item at position $index');
    debugPrint('completed item at position ${todo.isCompleted}');
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  _editTodo() {
    //   Navigator.pushNamed(context, '/edittodo', arguments: {index, value});
  }

  _deleteTodo(int index) async {
    setState(() {
      _isLoading = !_isLoading;
    });
    await HiveService.deleteTodoData(index);
    debugPrint('Deleted item at position $index');

    setState(() {
      _isLoading = !_isLoading;
    });
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
              child: ValueListenableBuilder(
                valueListenable: _todoBox.listenable(),
                builder: (context, Box<TodoItem> todos, child) =>
                    ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          var todo = todos.getAt(index);
                          return TodoTile(
                            title: todo!.title,
                            description: todo.description,
                            todoStatus: todo.isCompleted,
                            isCompleted: () {
                              _isCompleted(index, todo);
                            },
                            editTodo: () {
                              _editTodo();
                            },
                            deleteTodo: () {
                              _deleteTodo(index);
                            },
                          );
                        }),
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
