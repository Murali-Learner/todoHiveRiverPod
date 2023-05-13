import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/helpers/hive_data.dart';
import 'package:todo_riverpod/notification_helper.dart';
import 'package:todo_riverpod/pages/todo_tab_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper().initNotification();
  await HiveData.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: TodoTabBar(),
    );
  }
}
