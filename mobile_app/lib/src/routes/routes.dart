import 'package:flutter/material.dart';
import 'package:mobile_app/src/pages/pages.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'gallery': (BuildContext context) => GalleryPage(),
    'language': (BuildContext context) => LocalizationSystemPage(),
  };
}