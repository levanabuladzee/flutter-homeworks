import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:levan_abuladze_exam_2/data/models/expense.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class Database {
  static String? uid;

  static Future<void> addExpense({required Expense expense}) async {
    DocumentReference documentReference = _collectionReference.doc(uid)
        .collection("expenses")
        .doc();

    var data = <String, dynamic>{
      "title": expense.title,
      "expenseAmount": expense.expenseAmount,
      "description": expense.description
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("expense added!"))
        .catchError((e) => print(e));
  }

  static Future<QuerySnapshot> readExpenses() async {
    CollectionReference expensesReference = _collectionReference.doc(uid)
        .collection("expenses");
    return expensesReference.get();
  }

  static Future<double> getTotalExpenses() async {
    QuerySnapshot expenses = await readExpenses();
    double total = 0;
    for (var i = 0; i < expenses.size; i++) {
      total += expenses.docs[i].get("expenseAmount");
    }
    return total;
  }

  static Stream<QuerySnapshot> readExpensesAsStream() {
    CollectionReference expensesReference = _collectionReference.doc(uid)
        .collection("expenses");
    return expensesReference.snapshots();
  }

  static Future<void> updateExpense(
      {required String? docId, required Expense expense}) async {
    DocumentReference documentReference = _collectionReference.doc(uid)
        .collection("expenses")
        .doc(docId);

    var data = <String, dynamic>{
      "title": expense.title,
      "expenseAmount": expense.expenseAmount,
      "description": expense.description
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("expense updated!"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteExpense({required String docId}) async {
    DocumentReference documentReference = _collectionReference.doc(uid)
        .collection("expenses")
        .doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("expense deleted!"))
        .catchError((e) => print(e));
  }
}