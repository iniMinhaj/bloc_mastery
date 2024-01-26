part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccessfulState extends AuthState {
  final String msg;

  LoginSuccessfulState({required this.msg});
}

final class LoginFailureState extends AuthState {
  final String error;
  LoginFailureState(this.error);
}

final class AuthLoading extends AuthState {}
