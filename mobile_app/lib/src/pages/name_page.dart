import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  Name({Key? key}) : super(key: key);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<Name> {
TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intoduzca su nombre"),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Your name",
              labelText: "Name",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black
            ),
            border: UnderlineInputBorder()
          ),
          obscureText: false,
        ),
        // ignore: deprecated_member_use
        RaisedButton(onPressed: (){
          print("Name: " + _nameController.text);
        })
      ]),
    );
  }
}
