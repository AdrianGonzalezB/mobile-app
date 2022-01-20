import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicText extends StatefulWidget {//clase cambiante
 
  @override
  _DynamicText  createState() => _DynamicText();
 
}
 
class _DynamicText extends State<DynamicText> {
  //se requiere de la palabra, el estado de seleccionado, el tamaño default y el color default
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
      body: ListView( //se muestra como una lista de manera organizada
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _palabraInput(), // es un espacio para poner la palabra que tu quueras
          Divider(),
          Container( //el contenedor sera el que varia interactivamente despeus
          //tiene los parametros donde se acomodara la informacion
            height: 400,
            width: 300,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: _textoDinamico(),
            )
        ],
        ),
        floatingActionButton: FloatingActionButton( //crear el boton q lo cambia el estado de la palabra
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
    return TextField(//devuelve uun espacio para poner texto y en caso de que esta cambia, tambien la palabra que se muestra en el contenedor
      textCapitalization: TextCapitalization.sentences,
      onChanged: (valor){
        setState(() {
          _palabra = valor;
        //print(_nombre);
        });
      },
      decoration: InputDecoration( //informacion extra de decoracion
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

  Widget _textoDinamico() { //devuelve un AnimatedDefaultTextStyle que es la animacion que se muestra en el contenedor
          final random = Random();
    return AnimatedDefaultTextStyle(
      //los parametros de animacion
           duration: const Duration(milliseconds: 1000),
           curve: Curves.fastOutSlowIn,
           style: 
           TextStyle( //aqui se muestran los valores que pueden r cambiando
             fontSize: _size,
             color: Color.fromRGBO( //random de color RGB
               random.nextInt(255),
               random.nextInt(255),      
               random.nextInt(255), 
               1),
               fontWeight: isSelected ? FontWeight.w800 : FontWeight.w100
           ) ,
           child: Text(
             _palabra, //el texto sera la palabra proporcionada
             textAlign: TextAlign.center,
           ),
           
         );
  }

}