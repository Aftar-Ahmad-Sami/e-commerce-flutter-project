import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/categoryModel.dart';

class RemoteService {
 static Future<List<CAtegory>?> getCategory() async {
   print("print from ripository");
    String url = "https://happybuy.appsticit.com/getallcategory";
    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      var data = jsonEncode(jsonString['data']);
      print(data);

      return cAtegoryFromJson(data);
    } else {
      return null;
    }
  }
}