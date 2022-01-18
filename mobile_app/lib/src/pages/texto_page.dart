import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicText extends StatefulWidget {
 
  @override
  _DynamicText  createState() => _DynamicText();
 
}
 
class _DynamicText extends State<DynamicText> {
  String _palabra = '';
  bool isSelected = false;
  double _size = 50.0;
  Color _color = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texto Dinamico'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _palabraInput(),
          Divider(),
          Container(
            height: 400,
            width: 300,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: _textoDinamico(),
            )
        ],
        ),
        floatingActionButton: FloatingActionButton( //crear el boton q lo cambia
          child: Icon(Icons.play_arrow), //icono de play arrow
          onPressed: () => _random(), //si se presiona acciona el void
          )
    );
  }

  void _random(){
    final random = Random(); //se usa random
    setState(() {
      _size = random.nextInt(200).toDouble(); 
      _color = Color.fromRGBO( //random de color RGB
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1);//random borde
        isSelected = !isSelected;
    });
  }

   Widget _palabraInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      onChanged: (valor){
        setState(() {
          _palabra = valor;
        //print(_nombre);
        });
      },
      decoration: InputDecoration(
        hintText: 'Escribe algo',
        labelText: "Texto",
        suffixIcon: Icon(Icons.text_format),
        icon: Icon(Icons.text_fields),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
          ),
      ),
    );
  }

  Widget _textoDinamico() {
          final random = Random();
    return AnimatedDefaultTextStyle(
           duration: const Duration(milliseconds: 1000),
           curve: Curves.fastOutSlowIn,
           style: 
           TextStyle(
             fontSize: _size,
             color: Color.fromRGBO( //random de color RGB
               random.nextInt(255),
               random.nextInt(255),      
               random.nextInt(255), 
               1),
               fontWeight: isSelected ? FontWeight.w800 : FontWeight.w100
           ) ,
           child: Text(
             _palabra,
             textAlign: TextAlign.center,
           ),
           
         );
  }

}