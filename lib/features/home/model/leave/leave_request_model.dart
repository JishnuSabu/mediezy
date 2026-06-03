class ApplyLeaveRequest {
  final String leaveMode;
  final String leaveType;
  final String startDate;
  final String endDate;
  final String reason;
  final int userId;

  ApplyLeaveRequest({
    required this.leaveMode,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.userId,
  });

  Map<String,dynamic> toJson(){
    return {
      "leave_mode":leaveMode,
      "leave_type":leaveType,
      "start_date":startDate,
      "end_date":endDate,
      "reason":reason,
      "user_id":userId,
    };
  }
}