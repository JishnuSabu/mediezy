import 'package:mediezy_task/features/home/data_sources/leave/leave_remote_data_source.dart';
import 'package:mediezy_task/features/home/model/leave/leave_list_res_model.dart';
import 'package:mediezy_task/features/home/model/leave/leave_res_model.dart';
import 'package:mediezy_task/features/home/repository/leave/leave_repository.dart';

class LeaveRepositoryImpl
implements LeaveRepository {

final LeaveRemoteDatasource ds;

LeaveRepositoryImpl(
this.ds,
);

@override
Future<ApplyLeaveResponse> applyLeave({

required String leaveMode,
required String leaveType,
required String startDate,
required String endDate,
required String reason,
required int userId,

}) {

return ds.applyLeave(

leaveMode: leaveMode,
leaveType: leaveType,
startDate: startDate,
endDate: endDate,
reason: reason,
userId: userId,

);

}
@override
Future<LeaveListResponse> getLeaves({

required int employeeId,

required String leaveType,

required String month,

}) {

return ds.getLeaves(

employeeId: employeeId,

leaveType: leaveType,

month: month,

);

}

}