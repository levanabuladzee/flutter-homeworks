import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_3/data/database.dart';
import 'package:levan_abuladze_exam_3/data/models/todo.dart';
import 'package:levan_abuladze_exam_3/data/repository/todo_repository.dart';
import 'package:levan_abuladze_exam_3/util/hex_color.dart';
import 'package:provider/provider.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({Key? key}) : super(key: key);

  @override
  _EditTodoState createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _todoTaskController;
  late TextEditingController _todoDescriptionController;

  @override
  void initState() {
    var currentTodo = Provider.of<TodoRepository>(context, listen: false).currentTodo;
    super.initState();
    _titleController = TextEditingController(text: currentTodo.title);
    _todoTaskController =
        TextEditingController(text: currentTodo.todoTask);
    _todoDescriptionController =
        TextEditingController(text: currentTodo.todoDescription);
  }


  @override
  void dispose() {
    _titleController.dispose();
    _todoTaskController.dispose();
    _todoDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoRepository>(
      builder: (BuildContext context, todo, Widget? child) {
        return Container(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          color: HexColor("04a3a3"),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor("ffffff"),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor("ffffff"),
                          ),
                        ),
                        errorStyle: TextStyle(height: 0),
                        hintText: "Please enter title",
                        hintStyle: TextStyle(
                          color: HexColor("ffffff"),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    controller: _titleController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor("ffffff"),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor("ffffff"),
                          ),
                        ),
                        errorStyle: TextStyle(height: 0),
                        hintText: "Please enter task",
                        hintStyle: TextStyle(
                          color: HexColor("ffffff"),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    controller: _todoTaskController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor("ffffff"),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor("ffffff"),
                          ),
                        ),
                        errorStyle: TextStyle(height: 0),
                        hintText: "Please enter task details",
                        hintStyle: TextStyle(
                          color: HexColor("ffffff"),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    controller: _todoDescriptionController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          if (_formKey.currentState!.validate()) {
                            Todo newTodo = Todo(
                              title: _titleController.text,
                              todoTask:
                              _todoTaskController.text,
                              todoDescription: _todoDescriptionController.text, isDone: todo.currentTodo.isDone,
                            );
                            Database.updateTodo(docId: todo.currentTodo.docId, todo: newTodo);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "EDIT",
                          style: TextStyle(
                              color: HexColor("04a3a3"),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },);
  }
}
