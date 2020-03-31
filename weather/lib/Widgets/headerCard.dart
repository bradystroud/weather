import 'package:flutter/material.dart';

import 'package:weather/globals.dart' as globals;

class HeaderCard extends StatefulWidget {
  String formattedDate;

  HeaderCard(this.formattedDate);
  @override
  _HeaderCardState createState() => _HeaderCardState(formattedDate);
}

class _HeaderCardState extends State<HeaderCard> {
  String formattedDate;

  _HeaderCardState(this.formattedDate);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                formattedDate,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      globals.summary[0].toString() + '\u00B0',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      globals.summary[3].toString(),
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
      margin: EdgeInsets.all(50),
    );
  }
}
