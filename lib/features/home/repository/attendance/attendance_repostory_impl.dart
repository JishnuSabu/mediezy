import 'package:mediezy_task/features/home/data_sources/attendance/attendance_remote_data_source.dart';
import 'package:mediezy_task/features/home/model/attendance/attendance_route_res_model.dart';
import 'package:mediezy_task/features/home/model/attendance/attendance_status_res_model.dart';
import 'package:mediezy_task/features/home/repository/attendance/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDatasource ds;

  AttendanceRepositoryImpl(this.ds);

  @override
  Future<AttendanceStatusResponse> getAttendanceStatus() {
    return ds.getAttendanceStatus();
  }
  @override
Future markAttendance({
  required String status,
  required double latitude,
  required double longitude,
}) {
  return ds.markAttendance(
    status: status,
    latitude: latitude,
    longitude: longitude,
  );
}
  @override
  Future<AttendanceRouteModel> getRouteList() {
    return ds.getRouteList();
  }
}