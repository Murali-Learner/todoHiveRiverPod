import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:todo_riverpod/riverPods/stateNotifierProviders/stateNotifierProviders.dart';

class DeleteTodoButton extends ConsumerWidget {
  const DeleteTodoButton({
    super.key,
    required this.todo,
    required this.index,
  });

  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        ref.watch(allTodoListProvider.notifier).deleteTodoById(index);
        ref.watch(allTodoListProvider.notifier).getAllTodoList();
      },
    );
  }
}
