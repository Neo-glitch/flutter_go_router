import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_go_router/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.unauthenticated());

  void login() {
    emit(const LoginState.authenticated());
  }

  void logOut() {
    emit(const LoginState.unauthenticated());
  }
}
