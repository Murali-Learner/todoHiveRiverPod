import 'package:flutter/material.dart';
import 'package:todo_riverpod/enums/todoEnum.dart';
import 'package:todo_riverpod/models/todo_model.dart';

@immutable
class TodoCategories {
  List<Todo> todoList;
  TodoType todoType;
  TodoCategories({
    required this.todoList,
    required this.todoType,
  });
  TodoCategories copyWith({List<Todo>? todoList, TodoType? todoType}) {
    return TodoCategories(
      todoList: todoList ?? this.todoList,
      todoType: todoType ?? this.todoType,
    );
  }
}
