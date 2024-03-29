import 'dart:convert';
import 'package:carnova_webapp/resources/api_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;

  final headers = {"Content-Type": "application/json"};

  Future<http.Response> login(loginData) async {
    final url = Uri.parse('${Url.baseUrl}/${Url.login}');
    final body = jsonEncode(loginData);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> getAllVehicle(String token) async {
    final url = Uri.parse('${Url.baseUrl}/${Url.getAllvehicle}');
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> verifyHostVehicle(
      String vehicleId, String hostId, String token) async {
    final url = Uri.parse(
        '${Url.baseUrl}/${Url.verifyHostVehicle}?vehicleid=$vehicleId&hostid=$hostId');
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.patch(url, headers: header);
    return response;
  }

  rejectHostVehicle() {
    //
  }

  Future<http.Response> getAllHosts(String token) async {
    final url = Uri.parse("${Url.baseUrl}/${Url.getAllHosts}");
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> verifyHost(String id, String token) async {
    final url = Uri.parse('${Url.baseUrl}/${Url.verifyHost}/$id');
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.post(url, headers: header);
    return response;
  }

  Future<http.Response> getAllUsers(String token) async {
    final url = Uri.parse('${Url.baseUrl}/${Url.getAllUsers}');
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> blockUser(String id, String token) async {
    final url = Uri.parse('${Url.baseUrl}/${Url.blockUser}/$id');
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.patch(url, headers: header);
    return response;
  }

  Future<http.Response> unBlockUser(String id, String token) async {
    final url = Uri.parse('${Url.baseUrl}/${Url.unBlockUser}/$id');
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.patch(url, headers: header);
    print(response.statusCode);
    return response;
  }
}
