import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recipe/constants/routes.dart';

File? image;
String? filename;

class CreateRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              recipeRoute,
              (route) => false,
            );
          },
        ),
        title: const Text('Create Recipe'),
      ),
      body: MyAddPage(),
    );
  }
}

class CommonThings {
  static Size? size;
}

class MyAddPage extends StatefulWidget {
  @override
  _MyAddPageState createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
  // TextEditingController recipeInputController;
  // TextEditingController nameInputController;
  // TextEditingController imageInputController;

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Form(
            // key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // ignore: unnecessary_new
                    new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent),
                      ),
                      padding: new EdgeInsets.all(5.0),
                      // child: image == null ? const Text('Add') : Image.file(),
                    ),
                    const Divider(),
                    new IconButton(
                        icon: new Icon(Icons.camera_alt), onPressed: () {}),
                    const Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image), onPressed: () {}),
                  ],
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'name',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    //  validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    // },
                    // onSaved: (value) => name = value,
                  ),
                ),
                Container(
                  child: TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'recipe',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    //  validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter some recipe';
                    //   }
                    // },
                    // onSaved: (value) => recipe = value,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child:
                    const Text('Create', style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
