import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_meetup_state.dart';

class FetchMeetupCubit extends Cubit<FetchMeetupState> {
  FetchMeetupCubit() : super(FetchMeetupInitial());
}
