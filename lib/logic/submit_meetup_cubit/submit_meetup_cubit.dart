import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'submit_meetup_state.dart';

class SubmitMeetupCubit extends Cubit<SubmitMeetupState> {
  SubmitMeetupCubit() : super(SubmitMeetupState.initial());

  Future<void> submit() async {
    if (state.status == SubmitMeetupStatus.submitting) {
      // Return to avoid submit to many meetup
      return;
    }

    emit(state.copyWith(status: SubmitMeetupStatus.submitting));
    //  Submit meetup
    emit(state.copyWith(status: SubmitMeetupStatus.success));
  }
}
