import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_task/features/home/model/leave/leave_list_res_model.dart';

import 'package:mediezy_task/features/home/model/leave/leave_res_model.dart';

import 'package:mediezy_task/features/home/repository/leave/leave_repository.dart';

import 'leave_event.dart';
import 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final LeaveRepository repo;

  ApplyLeaveResponse? cachedLeave;
  LeaveListResponse? cachedLeaveList;
  LeaveBloc(this.repo) : super(LeaveInitial()) {
    on<ApplyLeave>(_applyLeave);
    on<FetchLeaves>(_fetchLeaves);
  }

  Future<void> _applyLeave(ApplyLeave event, Emitter<LeaveState> emit) async {
    emit(LeaveLoading());

    try {
      final response = await repo.applyLeave(
        leaveMode: event.leaveMode,
        leaveType: event.leaveType,
        startDate: event.startDate,
        endDate: event.endDate,
        reason: event.reason,
        userId: event.userId,
      );

      emit(LeaveSuccess(message: response.message));
    } catch (e) {
      emit(LeaveError(e.toString()));
    }
  }

  Future<void> _fetchLeaves(FetchLeaves event, Emitter<LeaveState> emit) async {
    emit(LeaveListLoading());
print("FETCH STARTED");
    try {
      final res = await repo.getLeaves(
        employeeId: event.employeeId,

        leaveType: event.leaveType,

        month: event.month,
      );

      cachedLeaveList = res;

      emit(LeaveListLoaded(res));
    } catch (e) {
      emit(LeaveError(e.toString()));
    }
  }
}
