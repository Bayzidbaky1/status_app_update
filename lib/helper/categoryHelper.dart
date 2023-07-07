import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/categoryModel.dart';

class CategoryHelper {
  Future<CategoryModel?> getData() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse('http://api.emearn365.com/api/categories'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return CategoryModel.fromJson(data);
    } else {
      return null;
    }
  }
}
