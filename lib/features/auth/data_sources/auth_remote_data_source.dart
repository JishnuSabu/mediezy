import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mediezy_task/core/constants/api_constants.dart';
import 'package:mediezy_task/core/network/api_exception.dart';
import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/login_res_model.dart';

class AuthRemoteDatasource {

  final http.Client client;

  AuthRemoteDatasource(this.client);

  Future<LoginResponse> login(
    LoginRequest request,
  ) async {

    try {

      final response = await client.post(

        Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.login}",
        ),

        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode(
          request.toJson(),
        ),

      );print("STATUS: ${response.statusCode}");
print("BODY: ${response.body}");

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        final json =
            jsonDecode(response.body);

        return LoginResponse.fromJson(
          json,
        );
      }

      throw ApiException(
        message:
        "Login Failed",
      );

    } catch (e) {

      throw ApiException(
        message:
        e.toString(),
      );

    }

  }

}