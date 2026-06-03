import 'package:mediezy_task/features/home/model/leave/leave_list_res_model.dart';
import 'package:mediezy_task/features/home/model/leave/leave_res_model.dart';

abstract class LeaveState {}

class LeaveInitial extends LeaveState {}

class LeaveLoading extends LeaveState {}

class LeaveLoaded extends LeaveState {

  final ApplyLeaveResponse data;

  LeaveLoaded(this.data);

}
class LeaveSuccess extends LeaveState {
  final String message;

  LeaveSuccess({required this.message});
}

class LeaveError extends LeaveState {

  final String message;

  LeaveError(this.message);

}
class LeaveListLoading extends LeaveState {}

class LeaveListLoaded extends LeaveState {

 final LeaveListResponse data;

 LeaveListLoaded(this.data);

}