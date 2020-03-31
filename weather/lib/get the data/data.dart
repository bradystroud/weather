// lib/hacker_news_scraper.dart
import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

Future getSummary(location) async {
  var client = Client();
  Response response = await client
      .get('http://www.bom.gov.au/qld/forecasts/' + location + '.shtml');

  // Use html parser
  var document = parse(response.body);
  List<Element> summary = document.querySelectorAll('div.forecast > p');
  List<Element> ddElement = document.querySelectorAll('dl > dd');

  String rainChanceFixed = ddElement[3].text;
  rainChanceFixed = rainChanceFixed.substring(
      0, rainChanceFixed.length - 6); //Removes chars from image

  List<Map<String, dynamic>> linkMap = [];

  linkMap.add({
    'summary': summary[0].text,
    'max': ddElement[1].text,
    'rainSummary': ddElement[2].text,
    'rainChance': rainChanceFixed,
  });

  // print(json.encode(linkMap));
  // writeData(json.encode(linkMap));
  // readData();
  return json.encode(linkMap);
}
