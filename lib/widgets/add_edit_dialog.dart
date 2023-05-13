import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import 'package:todo_riverpod/riverPods/stateNotifierProviders/stateNotifierProviders.dart';
import 'package:todo_riverpod/widgets/custom_date_picker.dart';

class AddEditTodoWidget extends ConsumerWidget {
  const AddEditTodoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Title'),
            onChanged: (String title) {
              ref.read(todoProvider.notifier).addTitle(title);
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            onChanged: (String description) {
              ref.read(todoProvider.notifier).addDescription(description);
            },
          ),
          const SizedBox(height: 16.0),
          const Text('Pick a date and time'),
          const SizedBox(height: 16.0),
          const DateTimePickerWidget(),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
