import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'get the data/readWrite.dart';
import 'Widgets/headerCard.dart';
import 'globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String formattedDate = DateFormat('MMMMEEEEd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello " + formattedDate),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: HeaderCard(formattedDate),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(globals.summary[1].toString()),
                      Text(globals.summary[2].toString()),
                    ],
                  ),
                ),
              ),
            ),

            FlatButton(
              padding: EdgeInsets.all(30),
              onPressed: () {
                setState(() {
                  _syncify("ipswich");
                });
              },
              child: Text("Ipswich"),
            ),
            // Text('27' + '\u00B0'), THIS IS THE UNICODE FOR DEGREEES
            FlatButton(
              padding: EdgeInsets.all(30),
              child: Text("Cairns"),
              onPressed: () {
                setState(() {
                  _syncify("cairns");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

_syncify(location) {
  // hi(location).then((data) {
  //   globals.summary = data;
  //   print("Globals.sum");
  //   print(globals.summary);
  // });
  // TRYING TO SET GLOBALS BACK IN READWRITE THEN ACCESS IT HERE.

  hi(location);
  print("GLOBALSDATA IS HERE" + globals.summary.toString());
}

hi(location) async {
  writeData(location);
  readData();
  // return await readData();
}
