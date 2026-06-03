class LeaveListResponse {
  final bool status;
  final String message;
  final List<LeaveItem> leaves;

  LeaveListResponse({
    required this.status,
    required this.message,
    required this.leaves,
  });

  factory LeaveListResponse.fromJson(Map<String,dynamic> json){

    return LeaveListResponse(

      status: json["status"],

      message: json["message"],

      leaves: (json["sales_executive_leaves"] as List)

          .map((e)=>LeaveItem.fromJson(e))

          .toList(),

    );

  }
}

class LeaveItem {

  final int id;

  final String leaveMode;

  final String leaveType;

  final String startDate;

  final String endDate;

  final String reason;

  final int status;

  LeaveItem({

    required this.id,

    required this.leaveMode,

    required this.leaveType,

    required this.startDate,

    required this.endDate,

    required this.reason,

    required this.status,

  });

  factory LeaveItem.fromJson(Map<String,dynamic> json){

    return LeaveItem(

      id: json["id"],

      leaveMode: json["leave_mode"],

      leaveType: json["leave_type"],

      startDate: json["start_date"],

      endDate: json["end_date"],

      reason: json["reason"],

      status: json["status"],

    );

  }

}