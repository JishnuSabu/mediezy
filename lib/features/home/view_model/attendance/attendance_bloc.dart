import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_task/features/home/model/attendance/attendance_route_res_model.dart';
import 'package:mediezy_task/features/home/model/attendance/attendance_status_res_model.dart';
import 'package:mediezy_task/features/home/repository/attendance/attendance_repository.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_event.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository repo;

AttendanceRouteModel? cachedRouteList;
AttendanceStatusResponse? cachedStatus;
  AttendanceBloc(this.repo) : super(AttendanceInitial()) {
    on<FetchAttendanceStatus>(_fetch);
    on<MarkAttendance>(markAttendance);
    on<FetchRouteList>(fetchRouteList);
  }

  Future<void> _fetch(FetchAttendanceStatus event, Emitter emit) async {
    emit(AttendanceStatusLoading());

    try {
      final res = await repo.getAttendanceStatus();
      cachedStatus = res;
emit(AttendanceStatusLoaded(res));
    } catch (e) {
      emit(AttendanceError(e.toString()));
    }
  }

Future<void> markAttendance(MarkAttendance event, Emitter emit) async {
  emit(AttendanceStatusLoading());

  try {
    await repo.markAttendance(
      status: event.status,
      latitude: event.latitude,
      longitude: event.longitude,
    );

    final statusRes = await repo.getAttendanceStatus();
    cachedStatus = statusRes;

    final routeRes = await repo.getRouteList(); 
    cachedRouteList = routeRes;

    emit(AttendanceStatusLoaded(statusRes));
  } catch (e) {
    emit(AttendanceError(e.toString()));
  }
}

 Future<void> fetchRouteList(FetchRouteList event, Emitter emit) async {
  emit(AttendanceRouteLoading());

  try {
    final res = await repo.getRouteList();
    cachedRouteList = res;
    emit(AttendanceRouteLoaded(res));
  } catch (e) {
    emit(AttendanceError(e.toString()));
  }
}
}
