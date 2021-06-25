import 'package:flutter/cupertino.dart';
import 'package:levan_abuladze_exam_3/data/database.dart';
import 'package:levan_abuladze_exam_3/data/models/todo.dart';

class TodoRepository extends ChangeNotifier {
  Todo currentTodo = Todo(title: "", todoTask: "", todoDescription: "", isDone: false);

  void changeCurrentTodo(String? docId) async {
    await Database.readTodo(docId: docId).then((value) => {
      currentTodo.title = value.get("title"),
      currentTodo.todoTask = value.get("todoTask"),
      currentTodo.todoDescription = value.get("todoDescription"),
      currentTodo.isDone = value.get("isDone"),
      currentTodo.docId = value.id
    });
    notifyListeners();
  }

  void changeCurrentTodoStatus() {
    currentTodo.isDone = !currentTodo.isDone;
    notifyListeners();
  }
}