import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'payment_pay_state.dart';

class PaymentAddCubit extends Cubit<PaymentPayState> {
  PaymentAddCubit({
    required this.meetUpCode,
    required this.clubCode,
    required this.apiRepository,
  }) : super(PaymentPayState.initial());

  final String meetUpCode;
  final String clubCode;
  final ApiRepository apiRepository;

  Future<void> pay() async {
    if (state.status == PaymentPayStatus.submitting) return;

    try {
      emit(state.copyWith(status: PaymentPayStatus.submitting));
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: PaymentPayStatus.error,
          errorStatus: e.message,
        ),
      );

      await apiRepository.request(
        postfix: '/payment/pay',
        method: 'POST',
        data: {
          'clubCode': clubCode,
          'meetUpCode': meetUpCode,
        },
      );

      emit(state.copyWith(status: PaymentPayStatus.success));
    } catch (e) {
      print(e);
    }
  }
}
