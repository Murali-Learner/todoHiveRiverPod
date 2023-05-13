import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';

class TodoProvider {
  static final allTodosProvider = StateProvider<List<Todo>>((_) => []);
  static final selectedDateTimeProvider =
      StateProvider<DateTime>((ref) => DateTime.now());

  final selectedDateTime = DateTime.now();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
}
