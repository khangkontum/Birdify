part of 'payment_pay_cubit.dart';

enum PaymentPayStatus { initial, submitting, success, error }

class PaymentPayState extends Equatable {
  const PaymentPayState({required this.status, required this.errorStatus});

  final PaymentPayStatus status;
  final String errorStatus;

  factory PaymentPayState.initial() {
    return const PaymentPayState(
        status: PaymentPayStatus.initial, errorStatus: '');
  }

  PaymentPayState copyWith({PaymentPayStatus? status, String? errorStatus}) {
    return PaymentPayState(
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
