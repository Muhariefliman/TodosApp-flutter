// ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todos_app/models/Todo.dart';
import 'package:todos_app/models/User.dart';
import 'package:todos_app/pages/profile.dart';
import '../widgets/TodoView.dart';
import 'package:get/get.dart';

class homePage extends StatelessWidget {
  homePage(User user) {
    this.user = user;
    todos = user.getTodos();
  }

  late User user;
  late List<Todo> todos;
  final TextEditingController _titileController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo(s) App"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextButton(onPressed: (){
              showDialog(
                  context: context, 
                    builder: (BuildContext context) => AlertDialog(
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
                            Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) => homePage(user),
                                    ),
                                    (route) => false,//if you want to disable back feature set to false
                            ),
                          }
                        },
                        child: const Text('Add Todo'),
                      ),
                      
                    ],
                  ),
                );
            }, child: Row(
              children: [
                Icon(Icons.note_add_rounded, color: Colors.white,),
                SizedBox(width: 5,),
                Text("Add Todo", style: TextStyle(color: Colors.white),),
              ],
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(
              onPressed: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(user))),
              }, 
              child: Row(
                children: [
                  Icon(Icons.person_outline_sharp, color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("Profile", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          if(todos.isEmpty)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text("No todos yet", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
            ),
          if(todos.isNotEmpty)
            for(Todo todo in todos)
              TodoView(todo, user),
        ],
      ),
    );
  }
}