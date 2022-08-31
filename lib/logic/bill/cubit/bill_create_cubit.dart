import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/bill_item.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'bill_create_state.dart';

class BillCreateCubit extends Cubit<BillCreateState> {
  BillCreateCubit(
      {required this.apiRepository,
      required this.clubCode,
      required this.meetUpCode})
      : super(BillCreateState.initial());

  final ApiRepository apiRepository;
  final String clubCode;
  final String meetUpCode;

  void addBillItem() {
    if (state.currentItem != BillItem.empty) {
      emit(
        state.copyWith(
            bill: state.bill.add(state.currentItem),
            status: BillCreateStatus.initial),
      );
    }
  }
}
