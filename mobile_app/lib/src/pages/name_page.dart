import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/localization_system_page.dart';

class Name extends StatefulWidget {
  Name({Key? key}) : super(key: key);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<Name> {
  TextEditingController _nameController = TextEditingController();
  String palabra = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Intoduzca su nombre"),
        ),
        body: Column(children: [
          TextField(
            onChanged: (valor) {
              setState(() {
                palabra = valor;
              });
            },
            decoration: InputDecoration(
                hintText: "Your name",
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                border: UnderlineInputBorder()),
            obscureText: false,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LocalizationSystemPage(paraula: palabra),
            ));
          },
        ));
  }
}
