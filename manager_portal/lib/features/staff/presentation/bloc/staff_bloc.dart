import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc() : super(StaffInitial()) {
    on<StaffEvent>((event, emit) {});
  }
}
