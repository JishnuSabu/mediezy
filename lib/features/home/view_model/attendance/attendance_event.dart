abstract class AttendanceEvent {}

class FetchAttendanceStatus extends AttendanceEvent {}

class MarkAttendance extends AttendanceEvent {
  final String status; // mark_in / mark_out
  final double latitude;
  final double longitude;

  MarkAttendance({
    required this.status,
    required this.latitude,
    required this.longitude,
  });
}
