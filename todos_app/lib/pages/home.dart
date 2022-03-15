// ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:todos_app/models/Todo.dart';
import 'package:get/get.dart';

import 'package:todos_app/models/User.dart';
import 'package:todos_app/pages/profile.dart';

import 'package:todos_app/widgets/add_todo.dart';
import '../widgets/TodoView.dart';


import 'package:todos_app/controller/ListController.dart';

class homePage extends StatelessWidget {
  homePage(User user) {
    this.user = user;
    todoListController.updateTodos(user.getTodos());
  }

  late User user;
  final ListController todoListController = Get.put(ListController());

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
                    builder: (BuildContext context) => add_todos(user: user, todoListController: todoListController),
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
        children: [
          Obx(() => 
            todoListController.todos.length == 0 ? 
            Center(child: Column(
              children: [
                SizedBox(height: 100,),
                Text("No Todo(s) Added", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            )) :
            ListView.builder(
              shrinkWrap: true,
              itemCount: todoListController.todos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoView(todoListController.todos[index], user, todoListController);
              },
            )
          ),
        ],
      ),
    );
  }
}