import 'package:flutter/material.dart';
import 'package:todo_app/Model/todo_model.dart';

class TodoProvider extends ChangeNotifier{
  final List<TodoModel> _todolist =[];

  List<TodoModel> get allTodoList => _todolist;

  void addTodoList(TodoModel todoModel){
   _todolist.add( todoModel);
   notifyListeners();
  }

  void todoStatusChange(TodoModel todoModel){
    final index = _todolist.indexOf(todoModel);
    _todolist[index].toggleCompleted();
    notifyListeners();
  }

  void removeTodoList(TodoModel todoModel){
    final index = _todolist.indexOf(todoModel);
    _todolist.removeAt(index);
    notifyListeners();
  }

}