import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) {
      return; // Avoid submitting many times;
    }
    if (state.status == LoginStatus.initial) {
      emit(state.copyWith(status: LoginStatus.submitting));
      try {
        await _authRepository.signInWithEmailAndPassword(
            email: state.email, password: state.password);
        emit(state.copyWith(status: LoginStatus.success));
      } on FirebaseAuthException catch (err) {
        print(err.code);
        emit(state.copyWith(
          status: LoginStatus.error,
          errorStatus: err.message,
        ));
      } catch (_) {
        print(_);
        emit(state.copyWith(
          status: LoginStatus.error,
        ));
      }
    }
  }
}
