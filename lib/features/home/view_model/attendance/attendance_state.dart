import 'package:mediezy_task/features/home/model/attendance_status_res_model.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final AttendanceStatusResponse data;

  AttendanceLoaded(this.data);
}

class AttendanceError extends AttendanceState {
  final String message;

  AttendanceError(this.message);
}