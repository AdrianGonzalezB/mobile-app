

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationSystemPage extends StatefulWidget {
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
              AppLocalizations.of(context)!.hello('Joan'),
              style: TextStyle(fontSize: 36),
            )
          ],
        ),
      ),
    );
    return Container();
  }
}