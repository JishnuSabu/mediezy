import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/constants/api_constants.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/home/model/leave/leave_list_res_model.dart';
import 'package:mediezy_task/features/home/model/leave/leave_res_model.dart';

class LeaveRemoteDatasource {
  final http.Client client;

  LeaveRemoteDatasource(this.client);

  Future<ApplyLeaveResponse> applyLeave({
    required String leaveMode,

    required String leaveType,

    required String startDate,

    required String endDate,

    required String reason,

    required int userId,
  }) async {
    final token = sl<StorageService>().token;

    final response = await client.post(
      Uri.parse("${ApiConstants.baseUrl}/apply-leave"),

      headers: {
        "Content-Type": "application/json",

        "Authorization": "Bearer $token",
      },

      body: jsonEncode({
        "leave_mode": leaveMode,

        "leave_type": leaveType,

        "start_date": startDate,

        "end_date": endDate,

        "reason": reason,

        "user_id": userId,
      }),
    );

    print("LEAVE STATUS: ${response.statusCode}");

    print("LEAVE BODY: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApplyLeaveResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to apply leave");
  }

  Future<LeaveListResponse> getLeaves({
    required int employeeId,

    required String leaveType,

    required String month,
  }) async {
    final token = sl<StorageService>().token;
 log(token.toString() + "sssds");
    final response = await client.post(
      Uri.parse("${ApiConstants.baseUrl}/leaves"),

      headers: {
        "Content-Type": "application/json",

        "Authorization": "Bearer $token",
      },

      body: jsonEncode({
        "employee_id": employeeId,

        "leave_type": leaveType,

        "month": month,
      }),
    );

    log(response.body + "pfoijdl");

    if (response.statusCode == 200) {
      return LeaveListResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed");
  }
}
