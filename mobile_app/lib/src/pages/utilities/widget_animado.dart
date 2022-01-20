import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetAnimado extends StatefulWidget { //cambio su estado
   String numero = " "; //tenemos las variables por default
   MaterialColor colorful = Colors.deepOrange;
   bool star = false;

   WidgetAnimado(String s, MaterialColor color, bool star) { //Constructor del widgets animado
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
  
  _ContainerState(Type container, String number, MaterialColor colorido, bool star){ //constructor para el estado del container
    this.numero = number;
    this.colorful = colorido;
    this.star = star;
  }

  @override
  Widget build(BuildContext context) {
    return 
    AnimatedScale( //Widget para cambio de escala para que se haga mas grande
            scale: selected ? 1.20 : 1.00, //tamaños variados
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector( //se detecta on tap para cambiar el estado del boolean
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child:  ( //se acomoda en posiciones para acomodar
                  _posiciones()
                
               )
              ),
            );
  }


  Widget _listaContainer(BuildContext context) { //Se prepara el contenedor
    return Container( //el contenedor es uun cuadrado que tiene un color establecido y unt exto al centro en este caso un numero
            margin: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 20),
            color: colorful,
            width: 100,
            height: 100,
            child:Center(child: Text(numero,textScaleFactor: 2.5,))
    );
      
    }

    Widget _posiciones(){
      
    return Stack( //se usa stack para poder acomodar objetos delante de otros, en este caso al estrella detras del contenedor
      children: <Widget>[   

          _estrella(context),
          _listaContainer(context),
        ],
    );
    }

    Widget _estrella(BuildContext context) { //se forma la estrella en caso de que el boolean sea afirmativo
      if(star){
      return AnimatedContainer( //devuelve un contenedor animado que translada la firgura de su posicion hacia abajo
            duration: Duration(milliseconds: 1000),
            curve: Curves.decelerate,
            margin: selected ? EdgeInsets.only(top: 125, left: 25) : EdgeInsets.only(top: 20, left: 25), //aqui se indica el traslado que hace
            child: Icon( //los parametros de la estrela que es un icono
              Icons.star,
              color: Colors.yellowAccent,
              size: 75,
              )
          );
      }
      return Text(""); //en caso de no tener el bolean da un texto vacio para no complciarse
    }
  }

