import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_3/data/database.dart';
import 'package:levan_abuladze_exam_3/data/repository/todo_repository.dart';
import 'package:levan_abuladze_exam_3/util/hex_color.dart';
import 'package:levan_abuladze_exam_3/widgets/edit_todo.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Consumer<TodoRepository>(
      builder: (BuildContext context, todo, Widget? child) {
        return SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.only(top: 15, left: width * 0.10, right: width * 0.10),
            color: HexColor("04a3a3"),
            child: Column(
              children: [
                Text(
                  todo.currentTodo.title,
                  style: TextStyle(
                      color: HexColor("ffffff"),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  todo.currentTodo.todoTask,
                  style: TextStyle(
                      color: HexColor("ffffff"),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "TODO DESCRIPTION",
                  style: TextStyle(
                      color: HexColor("ffffff"),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\t\t\t\t${todo.currentTodo.todoDescription}",
                    style: TextStyle(color: HexColor("ffffff"), fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      decoration: BoxDecoration(
                        color: todo.currentTodo.isDone ? HexColor("0ecc57") : HexColor("6cb4b1"),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          todo.changeCurrentTodoStatus();
                        },
                        child: Column(children: [
                          Icon(
                            Icons.check,
                            color: HexColor("ffffff"),
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "DONE",
                            style: TextStyle(
                                color: HexColor("ffffff"),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor("6cb4b1"),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (_) => EditTodo());
                        },
                        child: Column(children: [
                          Icon(
                            Icons.edit,
                            color: HexColor("ffffff"),
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "EDIT",
                            style: TextStyle(
                                color: HexColor("ffffff"),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor("6cb4b1"),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Are you sure?"),
                                content: Text(
                                    "Do you really want to delete this todo item?"),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context),
                                      child: Text("NO")),
                                  TextButton(
                                      onPressed: () {
                                        Database.deleteTodo(docId: todo.currentTodo.docId);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text("YES")),
                                ],
                              ));
                        },
                        child: Column(children: [
                          Icon(
                            Icons.delete,
                            color: HexColor("ffffff"),
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "DELETE",
                            style: TextStyle(
                                color: HexColor("ffffff"),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 172,
                        height: 44,
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Database.changeTodoStatus(docId: todo.currentTodo.docId, isDone: todo.currentTodo.isDone);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                color: HexColor("04a3a3"),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
