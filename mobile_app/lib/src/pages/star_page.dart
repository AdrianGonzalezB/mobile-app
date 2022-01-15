// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarPage extends StatefulWidget { //cambia su estado

  @override
  _AnimatedContainerPageState  createState() => _AnimatedContainerPageState(); //crear container animado
}

class _AnimatedContainerPageState extends State<StarPage> { 
  //medidas default
  double _width = 100.0; 
  double _height = 100.0;
  Color _color = Colors.cyan;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(5.0);

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
            _container()
          ],
          ),
        floatingActionButton: FloatingActionButton( //crear el boton q lo cambia
          child: Icon(Icons.refresh), //icono de play arrow
          onPressed: () => null, //si se presiona acciona el void
          ),
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

  Widget _contenedor(){

  return AnimatedContainer( //contenedor de animacion
          duration: Duration(milliseconds: 1000), //la duracion de la animacion
          curve: Curves.fastOutSlowIn, //cambio de curvas rapido
          width: _width, //ancho
          height: _height, //alto
          decoration: BoxDecoration( //decoracion interna
            borderRadius: _borderRadius, //borde del radio
            color: _color //color
          ),
        );
}

  Widget _container() {
    EdgeInsets margen =  EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20);
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: margen,
            color: Colors.blue,
            width: 100,
            height: 100,
            child:Center(child: Text("1",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.red,
            width: 100,
            height: 100,
            child:Center(child: Text("2",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.teal,
            width: 100,
            height: 100,
            child:Center(child: Text("3",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.indigo,
            width: 100,
            height: 100,
            child:Center(child: Text("4",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.orange,
            width: 100,
            height: 100,
            child:Center(child: Text("5",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.lightGreen,
            width: 100,
            height: 100,
            child:Center(child: Text("6",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.yellowAccent,
            width: 100,
            height: 100,
            child:Center(child: Text("7",textScaleFactor: 2.5,))
          ),
          Container(
            margin: margen,
            color: Colors.purple,
            width: 100,
            height: 100,
            child:Center(child: Text("8",textScaleFactor: 2.5,))
          ),
          WidgetAnimado()
          /*Container(
            margin: margen,
            color: Colors.amber,
            width: 100,
            height: 100,
            child:Center(child: Text("9",textScaleFactor: 2.5,))
          ),*/
        ],
      ),
    );
  }

}

class WidgetAnimado extends StatefulWidget {
  const WidgetAnimado({Key? key}) : super(key: key);

  @override
  State<WidgetAnimado> createState() => _ContainerState();
}

class _ContainerState extends State<WidgetAnimado> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
            scale: selected ? 1.10 : 1.00,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
            color: Colors.amber,
            width: 100,
            height: 100,
            child:Center(child: Text("9",textScaleFactor: 2.5,))
              ),
            ),
    );
  }
}



