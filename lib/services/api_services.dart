import '../model/detailsModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<DetailsModel?> getDetails ({required String slug}) async {
    final apiUrl = "http://api.emearn365.com/api/category/$slug/status";
      final response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode == 200){
        print(response.body);
        return detailsModelFromJson(response.body);
      } else{
        print('Error');
      }
  }
}