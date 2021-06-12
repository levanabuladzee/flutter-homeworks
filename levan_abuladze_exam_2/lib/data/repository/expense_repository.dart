import 'package:flutter/cupertino.dart';
import 'package:levan_abuladze_exam_2/data/database.dart';

class ExpenseRepository extends ChangeNotifier {
  double? totalExpenses = 0;

  void getTotalExpenses() {
    Database.getTotalExpenses().then((totalExpenses) => {
      this.totalExpenses = totalExpenses,
      notifyListeners()
    });
  }
}