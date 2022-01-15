import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';
import 'package:mobile_app/src/pages/staro_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'gallery': (BuildContext context) => GalleryPage(),
    'star': (BuildContext context) => StaroPage(),
    'pong': (BuildContext context) => PongGame(),
    'language': (BuildContext context) => LocalizationSystemPage()
  };
}