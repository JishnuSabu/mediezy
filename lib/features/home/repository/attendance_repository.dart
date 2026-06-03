import 'package:mediezy_task/features/home/model/attendance_status_res_model.dart';

abstract class AttendanceRepository {
  Future<AttendanceStatusResponse> getAttendanceStatus();
  Future markAttendance({
  required String status,
  required double latitude,
  required double longitude,
});
}
