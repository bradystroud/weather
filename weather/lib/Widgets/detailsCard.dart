import 'package:flutter/material.dart';

import 'package:weather/globals.dart' as globals;

class DetailsCard extends StatefulWidget {
  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(globals.summary[1].toString()),
            Text(globals.summary[2].toString()),
          ],
        ),
      ),
    );
  }
}
