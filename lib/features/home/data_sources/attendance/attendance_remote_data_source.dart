import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediezy_task/core/constants/api_constants.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/home/model/attendance/attendance_route_res_model.dart';
import 'package:mediezy_task/features/home/model/attendance/attendance_status_res_model.dart';

class AttendanceRemoteDatasource {
  final http.Client client;

  AttendanceRemoteDatasource(this.client);

  Future<AttendanceStatusResponse> getAttendanceStatus() async {
    final token = sl<StorageService>().token;

    final response = await client.get(
      Uri.parse("${ApiConstants.baseUrl}/attendance/status"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return AttendanceStatusResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to load attendance status");
  }

  Future markAttendance({
  required String status,
  required double latitude,
  required double longitude,
}) async {
  final token = sl<StorageService>().token;

  final response = await client.post(
    Uri.parse("${ApiConstants.baseUrl}/attendance/mark"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
    body: jsonEncode({
      "attendance_status": status,
      "latitude": latitude,
      "longitude": longitude,
    }),
  );


  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  }

  throw Exception("Failed to mark attendance");
}
Future<AttendanceRouteModel> getRouteList() async {
    final token = sl<StorageService>().token;
  final response = await client.get(
    Uri.parse("${ApiConstants.baseUrl}/attendance/route-list"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token", // if required
    },
  );
  if (response.statusCode == 200) {
    return AttendanceRouteModel.fromJson(jsonDecode(response.body));
  }

  throw Exception("Failed to load route list");
}

}