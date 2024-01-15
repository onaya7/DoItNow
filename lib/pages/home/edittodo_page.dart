import 'package:doitnow/data/todo_item.dart';
import 'package:doitnow/services/hiveservice.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_button.dart';
import 'package:doitnow/utils/components/textform_widget.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:doitnow/utils/validators/validators.dart';
import 'package:flutter/material.dart';

class EditTodoPage extends StatefulWidget {
  final String title;
  final String description;

  const EditTodoPage(
      {required this.title, required this.description, super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _detailController;

  bool _isLoading = false;

  late FocusNode _titleFocusNode;
  late FocusNode _detailFocusNode;

  @override
  void initState() {
    super.initState();
    _titleFocusNode = FocusNode();
    _detailFocusNode = FocusNode();
    _titleController = TextEditingController(text: widget.title);
    _detailController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _detailFocusNode.dispose();
    _detailController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  _updatetodo(int index) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = !_isLoading;
      });
      await HiveService.updateTodoData(
          index,
          TodoItem(
              title: _titleController.text,
              description: _detailController.text));
      setState(() {
        _isLoading = !_isLoading;
      });

      mounted ? Navigator.pushReplacementNamed(context, '/todo') : null;
    }
  }

  void _canceltodo() {
    Navigator.pushReplacementNamed(context, '/todo');
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
              title: Text(' Edit Task',
                  style: TextStyle(
                      color: ColorConstants.plainWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
            ),
            body: Container(
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
                            ),
                            const SizedBox(height: 43),
                            TextFormWidget(
                              hintText: 'Detail',
                              controller: _detailController,
                              currentFocus: _detailFocusNode,
                              action: TextInputAction.done,
                              validator: (value) =>
                                  TodoValidator.validateDescription(value),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 54, left: 14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 170,
                            child: CustomButton(
                                buttonName: 'Update',
                                onTap: () => _updatetodo(1)),
                          ),
                          SizedBox(
                            width: 170,
                            child: CustomButton(
                                buttonName: 'Cancel', onTap: () => _canceltodo),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
      ],
    );
  }
}
