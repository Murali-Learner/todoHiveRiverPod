import 'package:flutter/material.dart';
import 'package:todo_riverpod/widgets/add_edit_dialog.dart';
import 'package:todo_riverpod/widgets/add_todo_popup_button.dart';
import 'package:todo_riverpod/widgets/cancel_popup_button.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Add Todo'),
      content: AddEditTodoWidget(),
      actions: [
        CancelPopupButton(),
        AddTodoPopupButton(),
      ],
    );
  }
}
