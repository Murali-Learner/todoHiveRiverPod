import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part "todo_model.g.dart";

@immutable
@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String time;
  @HiveField(4)
  bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time': time,
      'isDone': isDone,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      time: map['time'],
      isDone: map['isDone'],
    );
  }

  Todo copyWith({
    String? id,
    String? description,
    bool? isDone,
    String? time,
    String? title,
  }) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      time: time ?? this.time,
      title: title ?? this.title,
    );
  }
}
