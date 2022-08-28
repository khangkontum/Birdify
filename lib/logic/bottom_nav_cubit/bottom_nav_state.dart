part of 'bottom_nav_cubit.dart';

enum BottomIndex { match, clubs, notification, profile }

abstract class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavInitial extends BottomNavState {}
