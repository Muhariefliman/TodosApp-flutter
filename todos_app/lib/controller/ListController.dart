
import 'package:get/get.dart';
import 'package:todos_app/models/Todo.dart';

class ListController extends GetxController{
  List<Todo> todos = <Todo>[].obs;

  updateTodos(List<Todo> todosW){
    todos.clear();
    for(Todo todo in todosW){
      todos.add(todo);
    }
  }

}