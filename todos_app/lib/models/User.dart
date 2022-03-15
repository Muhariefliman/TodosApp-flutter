// ignore_for_file: file_names

import 'package:todos_app/models/Todo.dart';

class User {

  User(
    String name,
    String email,
    String password,
  ){
    _name = name;
    _email = email;
    _password = password;
    todos = [];
  }

  late String _name;
  late String _email;
  late String _password;
  List<Todo> todos = [];

  get name => _name;
  get email => _email;
  get password => _password;

  bool addTodos(String title, String description, String date, String time){
    todos.add(Todo(title, description, date, time));
    return true;
  }

  bool removeTodos(Todo todo){
    todos.remove(todo);
    return true;
  }

  User getUser(
    String email,
    String password,){
    return this;
  }

  List<Todo> getTodos(){
    return todos;
  }
  

  
}