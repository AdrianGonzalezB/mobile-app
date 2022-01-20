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
  _AnimatedContainerPageState  createState() => _AnimatedContainerPageState(); //Crea la ventana principal
}

class _AnimatedContainerPageState extends State<StarPage> { 
  List<bool> ocupado= [false, false, false, false, false, false, false, false, false]; //control de cooleans por medio de una lista
  late int intAletorio; //el aleatorio se sacara de entre esos 9

  Random aleatorio = new Random();

  @override
  Widget build(BuildContext context) { //contenido
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Game'),
      ),
      body: ListView( //Se ordena en forma de lista 
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
            _texto(), //Primero el texto de informacion
            Divider(),
            _container(), //Luego los contenedores
          ],
          
       ) , 
       
          );
  }

  Widget _texto(){ //Texto principal
    return Text( 
    'Pulsa las cajas para encontrar la estrella escondida',
    style: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ));
  }


  Widget _container() {
    intAletorio = aleatorio.nextInt(9); //Se saca un numero aleatorio hasta el 9
    ocupado[intAletorio] = true; //y se le asigna a uno de los boolean
    return Container( //Devoluvemos un container con todos los contenedores animados
      child: Wrap( //Ordenados por wrap horizontal
        direction: Axis.horizontal,
        children: <Widget>[ //Cada contenedor animado se le pasa su numero en forma de tring, el color y el boolean antes preparado
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

