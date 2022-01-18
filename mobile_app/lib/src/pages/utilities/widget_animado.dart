import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetAnimado extends StatefulWidget {  
   String numero = " ";
   MaterialColor colorful = Colors.deepOrange;
   bool star = false;

   WidgetAnimado(String s, MaterialColor color, bool star) {
     this.numero = s;
     this.colorful = color;
     this.star = star;
   }

  @override
  State<WidgetAnimado> createState() => _ContainerState(Container, numero, colorful, star);
}

class _ContainerState extends State<WidgetAnimado> {
  bool selected = false;
  String numero = "0";
  MaterialColor colorful = Colors.deepOrange;
  bool star = false;
  
  _ContainerState(Type container, String number, MaterialColor colorido, bool star){
    this.numero = number;
    this.colorful = colorido;
    this.star = star;
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
              child:  (
                  
                  _posiciones(selected, star)
                
               )
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

    Widget _posiciones(bool selected, bool star){
      
    return Stack(
      children: <Widget>[   

          _estrella(context),
          _listaContainer(context),
        ],
    );
    }

    Widget _estrella(BuildContext context) {
      if(star){
      return AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.decelerate,
            margin: selected ? EdgeInsets.only(top: 125, left: 25) : EdgeInsets.only(top: 20, left: 25),
            child: Icon(
              Icons.star,
              color: Colors.yellowAccent,
              size: 75,
              )
          );
      }
      return Text("");
    }
  }

