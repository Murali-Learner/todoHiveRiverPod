import 'package:flutter/material.dart';
import 'package:todo_riverpod/boxes/hive_box.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static Box todoBox = Boxes.getTask();

  // To add User To hive
  static addTodoHive(Todo todo) async {
    await todoBox.add(todo);
  }

  // To delete User from hive
  static deleteTodo(int index) async {
    // var key = todo;
    try {
      await todoBox.deleteAt(index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // To update data in hive

  static updateStatus(Todo todo, int index) async {
    await todoBox.putAt(index, todo);
  }
}
