import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/search_model.dart';

class SearchHelper {
  Future<SearchModel?> getData(String searchValue) async {
    var client = http.Client();
    var response = await client.get(Uri.parse(
        "http://api.emearn365.com/api/categories-search?term=$searchValue"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return SearchModel.fromJson(data);
    } else {
      return null;
    }
  }
}
