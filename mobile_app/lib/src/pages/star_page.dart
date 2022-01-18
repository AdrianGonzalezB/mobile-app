// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';
import 'package:mobile_app/src/pages/utilities/widget_animado.dart';
import 'package:mobile_app/src/providers/menu_providers.dart';


class StarPage extends StatefulWidget { //cambia su estado

  @override
  _AnimatedContainerPageState  createState() => _AnimatedContainerPageState(); //crear container animado
}

class _AnimatedContainerPageState extends State<StarPage> { 
  List<bool> ocupado= [false, false, false, false, false, false, false, false, false];
  late int intAletorio; 

  Random aleatorio = new Random();
// Producir nuevo int aleatorio entre 0 y 99

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
          
       ) , 
       
          );
  }

  Widget _texto(){
    return Text(
    'Pulsa las cajas para encontrar la estrella escondida',
    style: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ));
  }


  Widget _container() {
    intAletorio = aleatorio.nextInt(9);
    ocupado[intAletorio] = true;
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          WidgetAnimado("1" , Colors.blue, ocupado[0]),
          WidgetAnimado("2" , Colors.red, ocupado[1]),
          WidgetAnimado("3" , Colors.teal, ocupado[2]),
          WidgetAnimado("4" , Colors.indigo, ocupado[3]),
          WidgetAnimado("5" , Colors.orange, ocupado[4]),
          WidgetAnimado("6" , Colors.lightGreen, ocupado[5]),
          WidgetAnimado("7" , Colors.blueGrey, ocupado[6]),
          WidgetAnimado("8" , Colors.purple, ocupado[7]),
          WidgetAnimado("9" , Colors.amber, ocupado[8]),
         
        ],
      ),
    );
  }

}

