import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_2/data/database.dart';
import 'package:levan_abuladze_exam_2/data/models/expense.dart';

class AddNewScreen extends StatefulWidget {
  static const routeName = "/add-new-expense";

  const AddNewScreen({Key? key}) : super(key: key);

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController expensesTitleController = TextEditingController();
  TextEditingController expensesAmountController = TextEditingController();
  TextEditingController expensesDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Expense"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid title";
                        }
                        return null;
                      },
                      controller: expensesTitleController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.title),
                          hintText: "Enter expense title"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid amount";
                        } else if (value != null &&
                            double.tryParse(value)! <= 0) {
                          return "Amount can't be negative or equal to 0";
                        }
                        return null;
                      },
                      controller: expensesAmountController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.money),
                          hintText: "Enter expense amount"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid description";
                        }
                        return null;
                      },
                      controller: expensesDescriptionController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: "Enter expense description"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Expense expense = Expense(
                            title: expensesTitleController.text,
                            expenseAmount:
                                double.tryParse(expensesAmountController.text),
                            description: expensesDescriptionController.text,
                          );
                          Database.addExpense(expense: expense);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("ADD"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
