import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.baseUrl);

  final String baseUrl;

  Future getData(String endpoint) async {
    final response =
        await http.get(Uri.parse(baseUrl + endpoint + "&units=metric"));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
