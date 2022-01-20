import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';



Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'gallery': (BuildContext context) => GalleryPage(),
    'star': (BuildContext context) => StarPage(),
    'pong': (BuildContext context) => PongGame(),
    'language': (BuildContext context) => Name(),
//  'language': (BuildContext context) => LocalizationSystemPage(),
    'text': (BuildContext context) => DynamicText(),
    'tictactoe': (BuildContext context) => GameScreen()
  };
}