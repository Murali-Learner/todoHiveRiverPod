import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/helpers/hive_helper.dart';
import 'package:todo_riverpod/models/todo_model.dart';

class TodoStateNotifier extends StateNotifier<Todo> {
  static Todo initialTodo = Todo(
    title: "",
    description: "",
    time: DateTime.now().toString(),
    isDone: false,
  );
  final Ref ref;
  TodoStateNotifier({required this.ref}) : super(initialTodo);
  void setTodoDateTime({required DateTime dateTime}) {
    state.time = dateTime.toIso8601String().toString();
  }

  Random random = Random();
  void addTitle(String title) {
    state.copyWith(title: title);
  }

  void addDescription(String description) {
    state.copyWith(description: description);
  }

  void createTodo() {
    state.copyWith(id: (random.nextInt(900000) + 100).toString());
    HiveHelper.addTodoHive(state);
  }

  get getDateTime => state.time;
}
