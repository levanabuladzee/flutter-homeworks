import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_2/data/database.dart';
import 'package:levan_abuladze_exam_2/data/models/expense.dart';
import 'package:levan_abuladze_exam_2/data/repository/expense_repository.dart';
import 'package:levan_abuladze_exam_2/screens/edit_screen.dart';
import 'package:provider/provider.dart';

import 'add_new_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Consumer<ExpenseRepository>(
              builder: (BuildContext context, expense, Widget? child) {
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 70,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Expenses:",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "${expense.totalExpenses!.toStringAsFixed(2)}\$",
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Database.readExpensesAsStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong!"));
                }

                if (snapshot.hasData || snapshot.data != null) {
                  Provider.of<ExpenseRepository>(context, listen: false)
                      .getTotalExpenses();
                  return ListView.builder(
                      itemBuilder: (context, index) => Card(
                            child: ListTile(
                              title:
                                  Text(snapshot.data!.docs[index].get("title")),
                              subtitle: Text(snapshot.data!.docs[index]
                                  .get("description")),
                              trailing: Text(
                                  "${snapshot.data!.docs[index].get("expenseAmount")!.toStringAsFixed(2)}\$"),
                              onTap: () {
                                Expense expense = Expense(
                                    title:
                                        snapshot.data!.docs[index].get("title"),
                                    expenseAmount: snapshot.data!.docs[index]
                                        .get("expenseAmount"),
                                    description: snapshot.data!.docs[index]
                                        .get("description"));
                                expense.docId = snapshot.data!.docs[index].id;
                                Navigator.pushNamed(
                                    context, EditScreen.routeName,
                                    arguments: expense);
                              },
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text("Are you sure?"),
                                          content: Text(
                                              "Do you really want to delete this expense item?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text("NO")),
                                            TextButton(
                                                onPressed: () {
                                                  Database.deleteExpense(
                                                      docId: snapshot.data!
                                                          .docs[index].id);
                                                  Navigator.pop(context);
                                                },
                                                child: Text("YES")),
                                          ],
                                        ));
                              },
                            ),
                          ),
                      key: UniqueKey(),
                      itemCount: snapshot.data!.size);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
