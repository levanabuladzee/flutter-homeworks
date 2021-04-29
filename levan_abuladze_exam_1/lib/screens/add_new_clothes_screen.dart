import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_1/data/model/clothes_model.dart';
import 'package:levan_abuladze_exam_1/data/repository/clothes_helper.dart';
import 'package:levan_abuladze_exam_1/widgets/clothes_text_form_field.dart';

class AddNewClothesScreen extends StatelessWidget {
  static const routeName = "/add-new-clothes";

  final _formKey = GlobalKey<FormState>();

  final TextEditingController clothesID = TextEditingController();
  final TextEditingController clothesName = TextEditingController();
  final TextEditingController clothesImageUrl = TextEditingController();
  final TextEditingController clothesSize = TextEditingController();
  final TextEditingController clothesPrice = TextEditingController();
  final TextEditingController clothesDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ClothesTextFormField(
                  controller: clothesID,
                  textInputType: TextInputType.number,
                  hintText: "Please enter ID",
                  errorText: "Please enter valid ID",
                ),
                SizedBox(height: 16,),
                ClothesTextFormField(
                  controller: clothesName,
                  textInputType: TextInputType.text,
                  hintText: "Please enter name",
                  errorText: "Please enter valid name",
                ),
                SizedBox(height: 16,),
                ClothesTextFormField(
                  controller: clothesImageUrl,
                  textInputType: TextInputType.text,
                  hintText: "Please enter image",
                  errorText: "Please enter valid image",
                ),
                SizedBox(height: 16,),
                ClothesTextFormField(
                  controller: clothesSize,
                  textInputType: TextInputType.text,
                  hintText: "Please enter size",
                  errorText: "Please enter valid size",
                ),
                SizedBox(height: 16,),
                ClothesTextFormField(
                  controller: clothesPrice,
                  textInputType: TextInputType.number,
                  hintText: "Please enter price",
                  errorText: "Please enter valid price",
                ),
                SizedBox(height: 16,),
                ClothesTextFormField(
                  controller: clothesDescription,
                  textInputType: TextInputType.text,
                  hintText: "Please enter description",
                  errorText: "Please enter valid description",
                ),
                Container(
                  margin: EdgeInsets.only(top: 240),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 128,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Back"),
                        ),
                      ),
                      SizedBox(
                        width: 128,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Clothes clothes = Clothes(
                                id: int.tryParse(clothesID.text),
                                name: clothesName.text,
                                imageUrl: clothesImageUrl.text,
                                size: clothesSize.text,
                                price: double.parse(clothesPrice.text),
                                description: clothesDescription.text
                              );
                              ClothesRepository().addClothes(clothes);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Add"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
