import 'package:flutter/material.dart';
import 'package:todos_app/models/User.dart';
import 'package:todos_app/controller/ListController.dart';
import 'package:todos_app/pages/home.dart';
import 'package:get/get.dart';


class add_todos extends StatelessWidget {
  add_todos({
    Key? key,
    required this.user,
    required this.todoListController,
  }) : super(key: key);


  final TextEditingController _titileController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final User user;
  final ListController todoListController;

  void clearTextField(){
    _titileController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: const Text('Add Todo', style: TextStyle(fontWeight: FontWeight.bold),),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _titileController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Todo(s) Title',
          ),
        ),
        SizedBox(height: 15,),
        TextField(
          controller: _descriptionController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Todo(s) Description',
          ),
        ),
        SizedBox(height: 15,),
        TextField(
          controller: _dateController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Todo(s) Date',
          ),
        ),
        SizedBox(height: 15,),
        TextField(
          controller: _timeController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Todo(s) Time',
          ),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () => {
          Navigator.pop(context),
        },
       child: Text('Cancel')
      ),
      TextButton(
        onPressed: () => {
          if(_titileController.text.isNotEmpty && _descriptionController.text.isNotEmpty && _dateController.text.isNotEmpty && _timeController.text.isNotEmpty) {
            user.addTodos(_titileController.text, _descriptionController.text, _dateController.text, _timeController.text),
            todoListController.update(user.getTodos()),
            clearTextField(),
            Navigator.pop(context),
            // Get.snackbar("Success", "Todos has been Created"),
            Get.off(homePage(user)),
            // Navigator.pushReplacement(context, MaterialPageRoute<void>(
            //           builder: (BuildContext context) => homePage(user),
            //           ),
            // ),
          }
        },
        child: const Text('Add Todo'),
      ),
      
    ],
                  );
  }
}