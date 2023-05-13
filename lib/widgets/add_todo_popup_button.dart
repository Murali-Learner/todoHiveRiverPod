import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:todo_riverpod/riverPods/stateNotifierProviders/stateNotifierProviders.dart';

class AddTodoPopupButton extends ConsumerWidget {
  const AddTodoPopupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Todo todo = ref.watch(todoProvider);
    return TextButton(
      onPressed: () {
        if (DateTime.parse(todo.time).isAfter(DateTime.now())) {
          ref.read(todoProvider.notifier).createTodo();
          Navigator.pop(context);
          ref.read(allTodoListProvider.notifier).getAllTodoList();
        } else {
          const snackBar = SnackBar(content: Text('Time should be in Future'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const Text('Add'),
    );
  }
}
