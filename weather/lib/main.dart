import 'package:flutter/material.dart';

import 'get the data/readWrite.dart';
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
  var now = new DateTime.now();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Row(children: <Widget>[]),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("todays summary: ${globals.summary}",
                  textAlign: TextAlign.center),
            ),
            FlatButton(
              padding: EdgeInsets.only(top: 80),
              onPressed: () {
                setState(() {
                  _syncify("ipswich");
                });
              },
              child: Text("Ipswich"),
            ),
            Text('27' + '\u00B0'),
            FlatButton(
              padding: EdgeInsets.all(20),
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
  hi(location).then((data) {
    globals.summary = data;
    print("Globals.sum");
    print(globals.summary);
  });
  if (globals.summary == null) {
    globals.summary = "No data found";
  }
}

Future<String> hi(location) async {
  writeData(location);
  return await readData();
}
