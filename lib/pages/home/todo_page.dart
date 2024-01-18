import 'package:doitnow/data/todo_item.dart';
import 'package:doitnow/pages/home/edittodo_page.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/services/hiveservice.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:doitnow/utils/components/custom_snackbar.dart';
import 'package:doitnow/utils/components/custom_tabbutton.dart';
import 'package:doitnow/utils/components/todo_tile.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _auth = FirebaseAuthService();
  late Box<TodoItem> _todoBox;

  bool _isLoading = false;

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

  _isCompleted(TodoItem todo) async {
    setState(() {
      _isLoading = !_isLoading;
    });
    todo.isCompleted = !todo.isCompleted;

    await HiveService.updateIsCompleted(todo.id, todo.isCompleted);

    setState(() {
      _isLoading = !_isLoading;
    });

    debugPrint('completed item at position ${todo.id}');
    debugPrint('completed item at position ${todo.isCompleted}');
  }

  _editTodo(String id, String title, String description) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditTodoPage(
                  id: id,
                  title: title,
                  description: description,
                )));
  }

  _deleteTodo(TodoItem todo) async {
    setState(() {
      _isLoading = !_isLoading;
    });
    await HiveService.deleteTodoData(todo.id);
    mounted
        ? CustomSnackBar.show(
            context,
            'Todo Deleted Successfully!',
          )
        : null;
    debugPrint('Deleted item at position ${todo.id}');

    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final UserData? user = Provider.of<UserData?>(context);
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
                builder: (context, Box<TodoItem> todos, child) {
                  var uncompletedTodos =
                      todos.values.where((todo) => !todo.isCompleted).toList();

                  if (uncompletedTodos.isEmpty) {
                    return const Center(
                        child: Text(
                            'No todos Items to display!')); // Display this when there are no todos
                  }
                  return Scrollbar(
                    child: RefreshIndicator(
                      color: ColorConstants.deepBlueColor,
                      onRefresh: HiveService.getTodoData,
                      child: ListView.builder(
                          itemCount: uncompletedTodos.length,
                          itemBuilder: (context, index) {
                            var todo = uncompletedTodos[index];
                            debugPrint('$todo');
                            return TodoTile(
                              title: todo.title,
                              description: todo.description,
                              todoStatus: todo.isCompleted,
                              isCompleted: () => _isCompleted(todo),
                              editTodo: () => _editTodo(
                                  todo.id, todo.title, todo.description),
                              deleteTodo: () => _deleteTodo(todo),
                            );
                          }),
                    ),
                  );
                }),
          ),
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





// FutureBuilder(
//               future: HiveService.openTodoBox,
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CustomLoader(
//                       unfocus: _unfocusLoader); // Display loading indicator
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return ValueListenableBuilder(
//                       valueListenable: _todoBox.listenable(),
//                       builder: (context, Box<TodoItem> todos, child) {
//                         var uncompletedTodos = todos.values
//                             .where((todo) => !todo.isCompleted)
//                             .toList();

//                         if (uncompletedTodos.isEmpty) {
//                           return const Center(
//                               child: Text(
//                                   'No todos Items to display!')); // Display this when there are no todos
//                         }
//                         return Scrollbar(
//                           child: RefreshIndicator(
//                             color: ColorConstants.deepBlueColor,
//                             onRefresh: HiveService.getTodoData,
//                             child: ListView.builder(
//                                 itemCount: uncompletedTodos.length,
//                                 itemBuilder: (context, index) {
//                                   var todo = uncompletedTodos[index];
//                                   debugPrint('$todo');

//                                   return TodoTile(
//                                     title: todo.title,
//                                     description: todo.description,
//                                     todoStatus: todo.isCompleted,
//                                     isCompleted: () => _isCompleted(todo),
//                                     editTodo: () => _editTodo(
//                                         todo.id, todo.title, todo.description),
//                                     deleteTodo: () => _deleteTodo(todo),
//                                   );
//                                 }),
//                           ),
//                         );
//                       });
//                 }
//               },
//             )