import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/detailsModel.dart';

class DetailsHelper {
  Future<DetailsModel?> getData(String slug) async {
    var client = http.Client();
    try{
      var response = await client
          .get(Uri.parse('http://api.emearn365.com/api/category/$slug/status'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return DetailsModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e){
      print(e);
    }
  }
}
