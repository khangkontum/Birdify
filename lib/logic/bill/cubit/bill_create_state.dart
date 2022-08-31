part of 'bill_create_cubit.dart';

enum BillCreateStatus { initial, submitting, success, error }

class BillCreateState extends Equatable {
  const BillCreateState({
    required this.bill,
    required this.currentItem,
    required this.status,
  });

  final List<BillItem> bill;
  final BillItem currentItem;
  final BillCreateStatus status;

  factory BillCreateState.initial() {
    return const BillCreateState(
      bill: <BillItem>[],
      currentItem: BillItem.empty,
      status: BillCreateStatus.initial,
    );
  }

  BillCreateState copyWith({
    List<BillItem>? bill,
    BillItem? currentItem,
    BillCreateStatus? status,
  }) {
    return BillCreateState(
      bill: bill ?? this.bill,
      currentItem: currentItem ?? this.currentItem,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        currentItem,
        bill,
        status,
      ];
}
