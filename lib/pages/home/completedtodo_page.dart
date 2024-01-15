import 'package:doitnow/data/todo_item.dart';
import 'package:doitnow/services/hiveservice.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:doitnow/utils/components/custom_tabbutton.dart';
import 'package:doitnow/utils/components/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CompletedTodoPage extends StatefulWidget {
  const CompletedTodoPage({super.key});

  @override
  State<CompletedTodoPage> createState() => _CompletedTodoPageState();
}

class _CompletedTodoPageState extends State<CompletedTodoPage> {
  late Box<TodoItem> _todoBox;
  bool _isLoading = false;

  @override
  void initState() {
    _todoBox = HiveService.todoBox;
    super.initState();
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

  void _unfocusLoader() {
    Navigator.pushReplacementNamed(context, '/completedtodo');
  }

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
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/todo'),
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
              child: ValueListenableBuilder(
                  valueListenable: _todoBox.listenable(),
                  builder: (context, Box<TodoItem> todos, child) {
                    var completedTodos =
                        todos.values.where((todo) => todo.isCompleted).toList();
                    return ListView.builder(
                        itemCount: completedTodos.length,
                        itemBuilder: (context, index) {
                          var todo = completedTodos[index];
                          debugPrint('$todo');
                          return TodoTile(
                            title: todo.title,
                            description: todo.description,
                            todoStatus: todo.isCompleted,
                            isCompleted: () => _isCompleted(todo),
                          );
                        });
                  })),
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
        if (_isLoading) CustomLoader(unfocus: _unfocusLoader),
      ],
    );
  }
}
