import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediezy_task/core/constants/api_constants.dart';
import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/sign_up_request_model.dart';

class AuthRemoteDatasource {
  final http.Client client;

  AuthRemoteDatasource(this.client);

  Future login(LoginRequest request) async {
    return _post("/user-login", request.toJson());
  }

  Future signUp(SignUpRequest request) async {
    return _post("/register", request.toJson());
  }

  Future _post(String endpoint, Map<String, dynamic> body) async {
    final response = await client.post(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    print("URL: $endpoint");
    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }

    throw Exception("API Failed");
  }
}