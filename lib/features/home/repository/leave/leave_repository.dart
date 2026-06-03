import 'package:mediezy_task/features/home/model/leave/leave_list_res_model.dart';
import 'package:mediezy_task/features/home/model/leave/leave_res_model.dart';

abstract class LeaveRepository {
  Future<ApplyLeaveResponse> applyLeave({
    required String leaveMode,
    required String leaveType,
    required String startDate,
    required String endDate,
    required String reason,
    required int userId,
  });

  Future<LeaveListResponse> getLeaves({
    required int employeeId,

    required String leaveType,

    required String month,
  });
}
