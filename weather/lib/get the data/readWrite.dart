import 'dart:convert';
import 'dart:io';

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
  contents = contents.substring(1);

  contents = contents.substring(0, contents.length - 1);
  print("BRACKET REMOVAL COMPLETED: ");
  print(contents);
  var fileCopy =
      await File('lib/data/data.json').writeAsString(contents);
  print(await fileCopy.exists());
  // print(await fileCopy.length());
}

readData() async {
  print("I CAN READ");
  var file = File('lib/data/data.json');
  print("file found");
  var contents = await file.readAsString();
  Map<String, dynamic> content = jsonDecode(contents);
  print(content);
  print('TODAYS SUMMARY:  ${content['summary']}');
  return '${content['summary']}';
}
