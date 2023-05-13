import 'package:flutter/material.dart';
import 'package:todo_riverpod/models/todo_model.dart';

class EditTodoButton extends StatelessWidget {
  const EditTodoButton({
    super.key,
    required this.todo,
  });
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {},
    );
  }
}
