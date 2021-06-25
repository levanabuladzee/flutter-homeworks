import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/todo.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class Database {
  static String? uid;

  static Future<void> addTodo({required Todo todo}) async {
    DocumentReference documentReference =
    _collectionReference.doc(uid).collection("todos").doc();

    var data = <String, dynamic>{
      "title": todo.title,
      "todoTask": todo.todoTask,
      "todoDescription": todo.todoDescription,
      "isDone": todo.isDone
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("todo added!"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readTodos() {
    CollectionReference todosReference =
    _collectionReference.doc(uid).collection("todos");
    return todosReference.snapshots();
  }

  static Future<DocumentSnapshot> readTodo({required String? docId}) async {
    return await _collectionReference
        .doc(uid)
        .collection("todos")
        .doc(docId)
        .get();
  }

  static Future<void> updateTodo(
      {required String? docId, required Todo todo}) async {
    DocumentReference documentReference =
    _collectionReference.doc(uid).collection("todos").doc(docId);

    var data = <String, dynamic>{
      "title": todo.title,
      "todoTask": todo.todoTask,
      "todoDescription": todo.todoDescription
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("todo updated!"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteTodo({required String? docId}) async {
    DocumentReference documentReference =
    _collectionReference.doc(uid).collection("todos").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("todo deleted!"))
        .catchError((e) => print(e));
  }

  static Future<void> changeTodoStatus(
      {required String? docId, required bool isDone}) async {
    DocumentReference documentReference =
    _collectionReference.doc(uid).collection("todos").doc(docId);

    var data = <String, dynamic>{
      "isDone": isDone,
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("todo status changed!"))
        .catchError((e) => print(e));
  }
}
