part of 'fetch_meetup_cubit.dart';

abstract class FetchMeetupState extends Equatable {
  const FetchMeetupState();

  @override
  List<Object> get props => [];
}

class FetchMeetupInitial extends FetchMeetupState {}
