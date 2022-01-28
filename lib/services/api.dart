import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_assignment/model/quotes.dart';

class Api {
  static Future<Quotes?> getQuotes() async {
    Uri url = Uri.parse('http://api.quotable.io/random');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print("success");
      return Quotes.fromJson(jsonDecode(response.body));
    } else {
      print("error in getting data");
    }
  }
}
