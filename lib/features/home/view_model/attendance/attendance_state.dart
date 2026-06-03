import 'package:mediezy_task/features/home/model/attendance_route_res_model.dart';
import 'package:mediezy_task/features/home/model/attendance_status_res_model.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}


class AttendanceStatusLoading extends AttendanceState {}
class AttendanceStatusLoaded extends AttendanceState {
  final AttendanceStatusResponse data;
  AttendanceStatusLoaded(this.data);
}

class AttendanceRouteLoading extends AttendanceState {}
class AttendanceRouteLoaded extends AttendanceState {
  final AttendanceRouteModel data;
  AttendanceRouteLoaded(this.data);
}

class AttendanceError extends AttendanceState {
  final String message;
  AttendanceError(this.message);
}