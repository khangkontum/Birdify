import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/presentation/screens/auth/signup_screen.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future<void> signupWithCredentials() async {
    if (state.status == SignupStatus.submitting) {
      return; // Avoid submitting many times;
    }
    if (state.status == SignupStatus.initial) {
      emit(state.copyWith(status: SignupStatus.submitting));
      try {
        await _authRepository.signUpWithEmailAndPassword(
            email: state.email, password: state.password);
        emit(state.copyWith(status: SignupStatus.success));
      } on FirebaseAuthException catch (err) {
        print(err.code);
        emit(state.copyWith(
          status: SignupStatus.error,
          errorStatus: err.message,
        ));
      }
    }
  }
}
