import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_task/features/home/repository/attendance_repository.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_event.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository repo;

  AttendanceBloc(this.repo) : super(AttendanceInitial()) {
    on<FetchAttendanceStatus>(_fetch);
    on<MarkAttendance>(markAttendance);
  }

  Future<void> _fetch(
    FetchAttendanceStatus event,
    Emitter emit,
  ) async {
    emit(AttendanceLoading());

    try {
      final res = await repo.getAttendanceStatus();
      emit(AttendanceLoaded(res));
    } catch (e) {
      emit(AttendanceError(e.toString()));
    }
  }
  Future<void> markAttendance(
  MarkAttendance event,
  Emitter emit,
) async {
  emit(AttendanceLoading());

  try {
    await repo.markAttendance(
      status: event.status,
      latitude: event.latitude,
      longitude: event.longitude,
    );

    final res = await repo.getAttendanceStatus();

    emit(AttendanceLoaded(res));
  } catch (e) {
    emit(AttendanceError(e.toString()));
  }
}
}