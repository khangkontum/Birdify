import 'package:equatable/equatable.dart';

class BillItem extends Equatable {
  final String item;
  final int amount;
  // final String? payment;

  const BillItem({
    required this.item,
    required this.amount,
    // this.payment = '',
  });

  static const empty = BillItem(
    item: '',
    amount: 0,
  );

  factory BillItem.fromJson(Map<String, dynamic> json) => BillItem(
        item: json['item'],
        amount: json['amount'],
      );

  @override
  List<Object?> get props => [
        amount,
        item,
      ];
}
