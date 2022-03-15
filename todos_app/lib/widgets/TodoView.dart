// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos_app/controller/ListController.dart';
import 'package:todos_app/models/Todo.dart';
import 'package:todos_app/models/User.dart';
import 'package:todos_app/pages/home.dart';


class TodoView extends StatelessWidget {
  
  TodoView(Todo todo, User user, ListController todoListController) {
    this.todo = todo;
    this.user = user;
    this.todoListController = todoListController;
  }
  late User user;
  late Todo todo;
  late ListController todoListController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
            blurRadius: 5
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        todo.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        todo.description,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${todo.date} | ${todo.time}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 10,),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: (){
                  showDialog(context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text("Delete Todos"),
                      content: Text("Are you sure you want to delete Todos?"),
                      actions: [
                        ElevatedButton(
                          child: Text("No"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text("Yes"),
                          onPressed: (){
                            user.removeTodos(todo);
                            todoListController.updateTodos(user.todos);
                            Navigator.of(context).pop();
                            Get.off(homePage(user));
                          },
                        ),
                      ],
                    );
                  });
                }, 
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done_all_rounded,)
                  ],
              )),
            )
          ],
        ),
      ),
    );
  }
}