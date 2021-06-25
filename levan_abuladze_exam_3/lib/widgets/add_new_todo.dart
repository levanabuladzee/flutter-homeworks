import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_3/data/database.dart';
import 'package:levan_abuladze_exam_3/data/models/todo.dart';
import 'package:levan_abuladze_exam_3/util/hex_color.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({Key? key}) : super(key: key);

  @override
  _AddNewTodoState createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _todoTaskController = TextEditingController();
  TextEditingController _todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Container(
      padding: EdgeInsets.only(
        left: width * 0.10,
        right: width * 0.10,
      ),
      color: HexColor("04a3a3"),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: new InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("6cb4b1"),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("6cb4b1"),
                      ),
                    ),
                    errorStyle: TextStyle(height: 0),
                    hintText: "Please enter title",
                    hintStyle: TextStyle(
                      color: HexColor("6cb4b1"),
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: new InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("6cb4b1"),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("6cb4b1"),
                      ),
                    ),
                    errorStyle: TextStyle(height: 0),
                    hintText: "Please enter task",
                    hintStyle: TextStyle(
                      color: HexColor("6cb4b1"),
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: new InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("6cb4b1"),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("6cb4b1"),
                      ),
                    ),
                    errorStyle: TextStyle(height: 0),
                    hintText: "Please enter task details",
                    hintStyle: TextStyle(
                      color: HexColor("6cb4b1"),
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
              height: 60,
            ),
            Row(
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
                      if (_formKey.currentState!.validate()) {
                        Todo todo = Todo(
                          title: _titleController.text,
                          todoTask:
                          _todoTaskController.text,
                          todoDescription: _todoDescriptionController.text,
                          isDone: false,
                        );
                        Database.addTodo(todo: todo);
                        Navigator.pop(context);
                      }
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
            )
          ],
        ),
      ),
    );
  }
}
