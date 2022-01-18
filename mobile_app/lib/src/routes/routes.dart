import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';
import 'package:mobile_app/src/pages/tic-tac-toe_page.dart';


Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'gallery': (BuildContext context) => GalleryPage(),
    'star': (BuildContext context) => StarPage(),
    'pong': (BuildContext context) => PongGame(),
    'language': (BuildContext context) => LocalizationSystemPage(),
    'text': (BuildContext context) => DynamicText(),
    'tictactoe': (BuildContext context) => GameScreen()
  };
}