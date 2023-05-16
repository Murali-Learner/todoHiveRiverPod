import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/enums/todoEnum.dart';
import 'package:todo_riverpod/helpers/helpers.dart';
import 'package:todo_riverpod/models/todo_categories.dart';
import 'package:todo_riverpod/pages/todos_page.dart';
import 'package:todo_riverpod/riverPods/stateNotifierProviders/stateNotifierProviders.dart';
import 'package:todo_riverpod/widgets/add_todo_dialog.dart';

class TodoTabBar extends ConsumerStatefulWidget {
  const TodoTabBar({Key? key}) : super(key: key);

  @override
  ConsumerState<TodoTabBar> createState() => TodoTabBarState();
}

class TodoTabBarState extends ConsumerState<TodoTabBar> {
  @override
  void initState() {
    final listRef = ref.read(allTodoListProvider.notifier);
    listRef.getAllTodoList();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<TodoCategories> allTodoList = ref.watch(allTodoListProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('Todo App'),
            bottom: allTodoList.isEmpty
                ? null
                : PreferredSize(
                    preferredSize: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.1),
                    child: TabBar(
                      onTap: (int tabIndex) {
                        ref.read(allTodoListProvider.notifier).getAllTodoList();
                      },
                      tabs: allTodoList.map(
                        (TodoCategories todoCategories) {
                          return TodoButton(
                            todoCount: todoCategories.todoList.length,
                            todoIcon: getTodoIcon(
                              todoType: todoCategories.todoType,
                            ),
                            todoType: todoTypeString[todoCategories.todoType] ??
                                "ALL",
                          );
                        },
                      ).toList(),
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Helpers.showBottomSheet(const AddTodoDialog(), context);
            },
            tooltip: 'Add Todo',
            child: const Icon(Icons.add),
          ),
          body: allTodoList.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : allTodoList.first.todoList.isEmpty
                  ? const Center(child: Text("Please add Todos"))
                  : Consumer(builder: (context, refer, _) {
                      List<TodoCategories> allTodos = refer
                          .watch(allTodoListProvider.notifier)
                          .getAllTodoList();
                      return TabBarView(
                        children: allTodos.map(
                          (TodoCategories todoCategories) {
                            return TodosPage(
                              todoList: todoCategories.todoList,
                            );
                          },
                        ).toList(),
                      );
                    })),
    );
  }
}

IconData getTodoIcon({required TodoType todoType}) {
  switch (todoType) {
    case TodoType.all:
      return Icons.all_inbox_sharp;
    case TodoType.outDated:
      return Icons.archive_outlined;
    case TodoType.pending:
      return Icons.pending_actions_outlined;
    default:
      return Icons.all_inbox_sharp;
  }
}

class TodoButton extends StatelessWidget {
  final String todoType;
  final int todoCount;
  final IconData todoIcon;
  const TodoButton({
    super.key,
    required this.todoCount,
    required this.todoIcon,
    required this.todoType,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(todoIcon),
      text: "$todoType $todoCount",
    );
  }
}
