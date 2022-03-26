import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/login_repository.dart';
import 'events/login_event.dart';
import 'states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final SharedPreferences sharedPreferences;

  LoginBloc(this.loginRepository, this.sharedPreferences) : super(LoginIdle()) {
    on<LoginWithEmail>(loginEmail);
  }

  Future loginEmail(LoginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      await loginRepository.login(event.email, event.password);
      emit(LoginSuccess());
    } catch (e) {
      e;
      emit(LoginFailure("Erro na senha ou no email"));
    }
  }
}
