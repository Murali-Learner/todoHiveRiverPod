import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/boxes/hive_box.dart';
import 'package:todo_riverpod/enums/todoEnum.dart';
import 'package:todo_riverpod/helpers/hive_helper.dart';
import 'package:todo_riverpod/models/todo_categories.dart';
import 'package:todo_riverpod/models/todo_model.dart';

class TodoListStateNotifier extends StateNotifier<List<TodoCategories>> {
  final Ref ref;
  TodoListStateNotifier({
    required this.ref,
  }) : super([]);

  List<TodoCategories> getAllTodoList() {
    var hiveTodoList = Boxes.getTask().values.toList();
    List<TodoCategories> todoList = getCategorizedTodoList(
      todoList: hiveTodoList,
    );
    Future.delayed(Duration.zero, () {
      state = [...todoList];
    });
    return todoList;
  }

  void updateTodoList(List<TodoCategories> updatedTodoList) {
    Future.delayed(Duration.zero, () {
      state = [...updatedTodoList];
    });
  }

  static List<TodoCategories> getCategorizedTodoList({
    required List<Todo> todoList,
  }) {
    return TodoType.values.map((TodoType todoType) {
      if (todoType == TodoType.all) {
        return TodoCategories(
          todoList: todoList,
          todoType: todoType,
        );
      }
      List<Todo> filteredList = todoList.where((todoElement) {
        DateTime currentDateTime = DateTime.now();
        DateTime formattedDate = DateTime.parse(todoElement.time);
        return todoType != TodoType.pending
            ? formattedDate.isBefore(currentDateTime)
            : formattedDate.isAfter(currentDateTime);
      }).toList();

      return TodoCategories(
        todoList: filteredList,
        todoType: todoType,
      );
    }).toList();
  }

  Future<void> updateTodoStatus(
    Todo todoItem,
    int index,
    bool isDone,
  ) async {
    List<Todo> newTodoList = [
      for (final todo in state.first.todoList)
        if (todo.id == todoItem.id) todo.copyWith(isDone: isDone) else todo,
    ];
    state.first.copyWith(todoList: newTodoList);
    HiveHelper.updateStatus(
      todoItem.copyWith(isDone: isDone),
      index,
    );
    getAllTodoList();
  }

  void deleteTodoById(int index) async {
    HiveHelper.deleteTodo(index);
    getAllTodoList();
  }
}
