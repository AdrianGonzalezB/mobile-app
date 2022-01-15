// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';
import 'package:mobile_app/src/providers/menu_providers.dart';


class StarPage extends StatefulWidget { //cambia su estado

  @override
  _AnimatedContainerPageState  createState() => _AnimatedContainerPageState(); //crear container animado
}

class _AnimatedContainerPageState extends State<StarPage> { 

  @override
  Widget build(BuildContext context) { //contenido
    return Scaffold(
      appBar: AppBar( //en la appbar
        title: Text('Star Game'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
            _texto(),
            Divider(),
            _container(),
          ],
          )  
           
          );
  }

  Widget _texto(){
    return Text(
    'Pulsa las cajas para encontrar las estrella escondidas',
    style: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ));
  }


  Widget _container() {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          WidgetAnimado("1" , Colors.blue),
          WidgetAnimado("2" , Colors.red),
          WidgetAnimado("3" , Colors.teal),
          WidgetAnimado("4" , Colors.indigo),
          WidgetAnimado("5" , Colors.orange),
          WidgetAnimado("6" , Colors.lightGreen),
          WidgetAnimado("7" , Colors.blueGrey),
          WidgetAnimado("8" , Colors.purple),
          WidgetAnimado("9" , Colors.amber),
         
        ],
      ),
    );
  }

}

class WidgetAnimado extends StatefulWidget {  
   String numero = " ";
   MaterialColor colorful = Colors.deepOrange;
   WidgetAnimado(String s, MaterialColor color) {
     this.numero = s;
     this.colorful = color;
   }

  @override
  State<WidgetAnimado> createState() => _ContainerState(Container, numero, colorful);
}

class _ContainerState extends State<WidgetAnimado> {
  bool selected = false;
  String numero = "0";
  MaterialColor colorful = Colors.deepOrange;
  
  _ContainerState(Type container, String number, MaterialColor colorido){
    this.numero = number;
    this.colorful = colorido;
  }

  @override
  Widget build(BuildContext context) {
    return 
    AnimatedScale(
            scale: selected ? 1.20 : 1.00,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child:  _posiciones(selected)
              ),
            );
  }


  Widget _listaContainer(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 20),
            color: colorful,
            width: 100,
            height: 100,
            child:Center(child: Text(numero,textScaleFactor: 2.5,))
    );
      
    }

    Widget _posiciones(bool selected){
    return Stack(
      children: <Widget>[    
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.decelerate,
            margin: selected ? EdgeInsets.only(top: 125, left: 25) : EdgeInsets.only(top: 20, left: 25),
            child: Icon(
              Icons.star,
              color: Colors.yellowAccent,
              size: 75,
              )
          ),
          _listaContainer(context),
        ],
    );
  }
  }

