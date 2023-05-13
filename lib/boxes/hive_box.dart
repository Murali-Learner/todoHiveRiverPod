import 'package:hive/hive.dart';
import 'package:todo_riverpod/models/todo_model.dart';

class Boxes {
  static Box<Todo> getTask() => Hive.box<Todo>("todos");
}
