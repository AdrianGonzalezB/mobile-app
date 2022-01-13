import 'package:flutter/material.dart';
import 'package:mobile_app/src/providers/menu_providers.dart';
import 'package:mobile_app/src/utils/icona_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app'),
      ),
      body: _llista(),
    );
  }

  Widget _llista() {
    return FutureBuilder(
        future: menuProvider.CarregarDades(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          //print('builder');
          //print(snapshot.data);
          return ListView(
            children: _llistaElements(context, snapshot.data),
          );
        });
  }

  List<Widget> _llistaElements(BuildContext context, List<dynamic>? data) {
    // ? para decir que puede ser null
    final List<Widget> elements = [];
    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texte']),
        leading: getIcon(element['icona']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      elements
        ..add(widgetTemp)
        ..add(Divider());
    });
    return elements;
  }
}
