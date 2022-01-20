import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_app/src/pages/name_page.dart';

class LocalizationSystemPage extends StatefulWidget {
  final String paraula;
  LocalizationSystemPage({required this.paraula});
  @override
  _LocalizationSystemPageState createState() => _LocalizationSystemPageState();
}

class _LocalizationSystemPageState extends State<LocalizationSystemPage> {
  @override
  Widget build(BuildContext context){
  return Scaffold(
      appBar: AppBar(
        title: Text('Idiomes'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.hello(widget.paraula),
              style: TextStyle(fontSize: 36),
            )
          ],
        ),
      ),
    );
    return Container();
  }
}