import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'gallery': (BuildContext context) => GalleryPage(),
<<<<<<< HEAD
    'language': (BuildContext context) => LocalizationSystemPage(),
=======
    'pong': (BuildContext context) => PongGame()
>>>>>>> 6c0742c000fcc4297c0910a07cd3e1b71ce837f7
  };
}