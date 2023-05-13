// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_riverpod/riverPods/stateNotifierProviders/stateNotifierProviders.dart';

class DateTimePickerWidget extends StatelessWidget {
  const DateTimePickerWidget({super.key});

  Future<void> _selectDateTime(BuildContext context, WidgetRef ref) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedDateTime),
      );

      if (pickedTime != null) {
        DateTime dateTime = DateTime(pickedDateTime.year, pickedDateTime.month,
            pickedDateTime.day, pickedTime.hour, pickedTime.minute);
        ref.read(todoProvider.notifier).setTodoDateTime(dateTime: dateTime);
        log(ref.refresh(todoProvider).time);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () => _selectDateTime(context, ref),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 8.0),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  DateFormat('EEE, MMM d, yyyy, hh:mm a').format(DateTime.parse(
                      ref.watch(todoProvider.notifier).state.time)),
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
