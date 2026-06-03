import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mediezy_task/core/constants/api_constants.dart';

class ApiClient {

 final http.Client client;

 ApiClient(this.client);

 Future<dynamic> get(String endpoint) async {

   final response =
   await client.get(
     Uri.parse(
      ApiConstants.baseUrl + endpoint,
     ),
   );

   return _handle(response);

 }

 Future<dynamic> post(
     String endpoint,
     Map<String,dynamic> body
 ) async {

   final response =
   await client.post(
     Uri.parse(
       ApiConstants.baseUrl+endpoint
     ),
     body: jsonEncode(body),
     headers: {
       "Content-Type":
       "application/json"
     },
   );

   return _handle(response);

 }

 dynamic _handle(
     http.Response response){

   if(response.statusCode==200){

      return jsonDecode(
      response.body);

   }

   throw Exception();

 }

}