abstract class AttendanceEvent {}

class FetchAttendanceStatus extends AttendanceEvent {}

class MarkAttendance extends AttendanceEvent {
  final String status;
  final double latitude;
  final double longitude;

  MarkAttendance({
    required this.status,
    required this.latitude,
    required this.longitude,
  });
}
class FetchRouteList extends AttendanceEvent {}
