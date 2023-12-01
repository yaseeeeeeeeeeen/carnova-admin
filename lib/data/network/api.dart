import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:carnova_webapp/resources/api_urls.dart/api_urls.dart';

class ApiService {
  ApiService._();
  static final _instance = ApiService._();
  static ApiService get instance => _instance;

  final header = {'Content-Type': 'application/json'};

  Future<http.Response> loginAdmin(loginData) async {
    print('called');
    final url = Uri.parse('${ApiUrls.baseUrl}/${ApiUrls.login}');
    final body = jsonEncode(loginData);
    final response = await http.post(url, headers: header, body: body);
    print(response.statusCode);
    return response;
  }
}
