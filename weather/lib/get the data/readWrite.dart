import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'data.dart';

import '../globals.dart' as globals;

main() async {
  var file = File('weatherdata.txt');
  var contents = "many things";

  if (await file.exists()) {
    // Read file
    contents = await file.readAsString();
    print(contents);
  }
}

writeData(location) async {
  getSummary(location).then((contents) {
    contents = contents.substring(1);
    contents = contents.substring(0, contents.length - 1);
    print(contents);
    writeFile(contents);
  });
}

writeFile(contents) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  print("THis is the data im writing to file" + contents);
  var file = await File('${appDocDir.path}/data.json').writeAsString(contents);
  print("FILE EXISTS: ");
  print(await file.exists());
  print("FILE LENGTH: ");
  print(await file.length());
}

readData() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  print("I CAN READ");
  var file = File('${appDocDir.path}/data.json');
  print("file found");
  var contents = await file.readAsString();
  Map<String, dynamic> content = jsonDecode(contents);
  globals.summary = [
    content['max'],
    content['summary'],
    content['rainChance'],
    content['rainSummary'],
  ];
  print("I HAVE SET GLOBALS ");
  print(globals.summary.toString());
  // return '${content['summary']}';
  // print(contents);
  // return contents;
}
