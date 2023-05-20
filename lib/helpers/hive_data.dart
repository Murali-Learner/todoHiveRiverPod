import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_riverpod/models/todo_model.dart';

class HiveData {
  static init() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>("todos");
  }
}
