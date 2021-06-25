import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_3/data/database.dart';
import 'package:levan_abuladze_exam_3/data/repository/todo_repository.dart';
import 'package:levan_abuladze_exam_3/util/hex_color.dart';
import 'package:levan_abuladze_exam_3/widgets/add_new_todo.dart';
import 'package:levan_abuladze_exam_3/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward(from: 0);
  late final AnimationController _offsetController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward(from: 0);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _offsetController,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _offsetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      "TODO APP",
                      style: TextStyle(
                          color: HexColor("707070"),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: width * 0.10),
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context, builder: (_) => AddNewTodo());
                    },
                    child: Icon(
                      Icons.add,
                      color: HexColor("ffffff"),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: HexColor("04a3a3"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: width * 0.10, right: width * 0.10),
              decoration: BoxDecoration(
                color: HexColor("6cb4b1"),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: Database.readTodos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData || snapshot.data != null) {
                    return SlideTransition(
                      position: _offsetAnimation,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          key: UniqueKey(),
                          itemCount: snapshot.data!.size,
                          itemBuilder: (context, index) => Card(
                                child: ListTile(
                                  onTap: () {
                                    Provider.of<TodoRepository>(context, listen: false).changeCurrentTodo(snapshot.data!.docs[index].id);
                                    showModalBottomSheet(
                                        context: context, builder: (_) => TodoItem());
                                  },
                                  title: Text(
                                    snapshot.data!.docs[index].get("title"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    snapshot.data!.docs[index].get("todoTask"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  trailing: Container(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var status = snapshot.data!.docs[index]
                                            .get("isDone");
                                        var docId =
                                            snapshot.data!.docs[index].id;
                                        Database.changeTodoStatus(
                                            docId: docId, isDone: !status);
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: HexColor("ffffff"),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        primary: snapshot.data!.docs[index]
                                                .get("isDone")
                                            ? HexColor("#0ecc57")
                                            : HexColor("#969897"),
                                      ),
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
