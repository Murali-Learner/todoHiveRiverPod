import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_categories.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:todo_riverpod/riverPods/stateNotifiers/todoListStateNotifier.dart';
import 'package:todo_riverpod/riverPods/stateNotifiers/todoStateNotifier.dart';

final allTodoListProvider =
    StateNotifierProvider<TodoListStateNotifier, List<TodoCategories>>((ref) {
  return TodoListStateNotifier(ref: ref);
});

final todoProvider = StateNotifierProvider<TodoStateNotifier, Todo>((ref) {
  return TodoStateNotifier(ref: ref);
});
final loadingProvider = StateProvider.autoDispose((ref) => false);
