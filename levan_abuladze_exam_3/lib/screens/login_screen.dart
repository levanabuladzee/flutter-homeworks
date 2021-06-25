import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_3/data/database.dart';
import 'package:levan_abuladze_exam_3/util/hex_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.20, right: width * 0.20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/app_logo.png"),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: HexColor("6cb4b1"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      errorStyle: TextStyle(height: 0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    controller: _textEditingController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: HexColor("6cb4b1"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Database.uid = _textEditingController.text;
                        Navigator.pushReplacementNamed(context, "/home");
                      }
                    },
                    child: Text("LOGIN", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
