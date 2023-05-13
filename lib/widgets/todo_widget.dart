// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:todo_riverpod/riverPods/stateNotifierProviders/stateNotifierProviders.dart';
import 'package:todo_riverpod/riverPods/stateNotifiers/todoStateNotifier.dart';
import 'package:todo_riverpod/widgets/custom_check_box.dart';
import 'package:todo_riverpod/widgets/delete_todo_button.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final int index;
  const TodoWidget({
    Key? key,
    required this.todo,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Card(
        child: ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          leading: CustomCheckbox(
            value: todo.isDone,
            onChanged: (bool value) {
              print("object $value");
              ref
                  .read(allTodoListProvider.notifier)
                  .updateTodoStatus(todo, index, value);
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(DateFormat('MMMM d, y, h:mm a')
                  .format(DateTime.parse(todo.time))),
              // EditTodoButton(todo: todo),
              DeleteTodoButton(todo: todo, index: index),
            ],
          ),
        ),
      );
    });
  }
}
