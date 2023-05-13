import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:todo_riverpod/widgets/todo_widget.dart';

class TodosPage extends ConsumerWidget {
  final List<Todo> todoList;
  const TodosPage({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: const EdgeInsets.all(5),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        final Todo todo = todoList[index];
        return TodoWidget(
          todo: todo,
          index: index,
        );
      },
    );
  }
}
