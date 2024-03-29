import 'package:doitnow/data/todo_item.dart';
import 'package:doitnow/services/hiveservice.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_button.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:doitnow/utils/components/textform_widget.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:doitnow/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  bool _isLoading = false;

  late FocusNode _titleFocusNode;
  late FocusNode _detailFocusNode;

  @override
  void initState() {
    _titleFocusNode = FocusNode();
    _detailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _detailFocusNode.dispose();
    _detailController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _addTodo() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = !_isLoading;
      });
      await HiveService.addTodoData(TodoItem(
          id: const Uuid().v4(),
          title: _titleController.text,
          description: _detailController.text));
      setState(() {
        _isLoading = !_isLoading;
      });

      mounted ? Navigator.pushReplacementNamed(context, '/todo') : null;
    }
  }

  void _unfocusLoader() {
    Navigator.pushNamed(context, '/addtodo');
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
                        Navigator.pushReplacementNamed(context, '/todo'))),
            title: Text(' Add Task',
                style: TextStyle(
                    color: ColorConstants.plainWhiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
          body: SingleChildScrollView(
            child: Container(
                color: ColorConstants.plainWhiteColor,
                width: Constants.deviceMaxWidth(context),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 29, left: 29, right: 29),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormWidget(
                                hintText: 'Title',
                                controller: _titleController,
                                currentFocus: _titleFocusNode,
                                nextFocus: _detailFocusNode,
                                action: TextInputAction.next,
                                validator: (value) =>
                                    TodoValidator.validateTitle(value),
                                    maxLines: 1,
                                    ),
                                    
                            const SizedBox(height: 43),
                            TextFormWidget(
                              hintText: 'Detail',
                              controller: _detailController,
                              currentFocus: _detailFocusNode,
                              action: TextInputAction.newline,
                              validator: (value) =>
                                  TodoValidator.validateDescription(value),
                              maxLines: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 54, left: 14, right: 14),
                      child: CustomButton(buttonName: 'Add', onTap: _addTodo),
                    )
                  ],
                )),
          ),
        ),
        if (_isLoading) CustomLoader(unfocus: _unfocusLoader),
      ],
    );
  }
}
