abstract class LeaveEvent {}

class ApplyLeave extends LeaveEvent {
  final String leaveMode;
  final String leaveType;
  final String startDate;
  final String endDate;
  final String reason;
  final int userId;

  ApplyLeave({
    required this.leaveMode,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.userId,
  });
}

class FetchLeaves extends LeaveEvent {
  final int employeeId;

  final String leaveType;

  final String month;

  FetchLeaves({
    required this.employeeId,

    required this.leaveType,

    required this.month,
  });
}
