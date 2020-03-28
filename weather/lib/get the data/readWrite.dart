import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

main() async {
  var file = File('weatherdata.txt');
  var contents = "many things";

  if (await file.exists()) {
    // Read file
    contents = await file.readAsString();
    print(contents);
  }
}

writeData(contents) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  contents = contents.substring(1);
  contents = contents.substring(0, contents.length - 1);
  print("BRACKET REMOVAL COMPLETED: ");
  print(contents);
  var fileCopy = await File('${appDocDir.path}/test.txt').writeAsString(contents);
  print(await fileCopy.exists());
  // print(await fileCopy.length());
}

readData() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  print("I CAN READ");
  var file = File('${appDocDir.path}/test.txt');
  print("file found");
  var contents = await file.readAsString();
//   Map<String, dynamic> content = jsonDecode(contents);
//   print(content);
//   print('TODAYS SUMMARY:  ${content['summary']}');
//   return '${content['summary']}';
  print(contents);
  return contents;
}
