import 'package:flutter/material.dart';
import 'package:mobile_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_variada',
      initialRoute: '/',
      routes: getRoutes(),
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigoAccent[400])),
    );
  }
}
