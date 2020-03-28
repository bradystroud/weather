// lib/hacker_news_scraper.dart
import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

import '../get the data/readWrite.dart';

Future getSummary(location) async {
  var client = Client();
  Response response = await client
      .get('http://www.bom.gov.au/qld/forecasts/' + location + '.shtml');

  // Use html parser
  var document = parse(response.body);
  List<Element> summary = document.querySelectorAll('div.forecast > p');
  List<Map<String, dynamic>> linkMap = [];

  linkMap.add({'summary': summary[0].text,});

  print(json.encode(linkMap));
  writeData(json.encode(linkMap));
  readData();
}

void main() {
  // initiate();
  String location = "brisbane";
  getSummary(location);
}

class Summary {
  final String summary;

  Summary(this.summary);

  Summary.fromJson(Map<String, dynamic> json) : summary = json['summary'];

  Map<String, dynamic> toJson() => {
        'summary': summary,
      };
}
