import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        String email = event.email;
        String password = event.password;

        if (email.isEmpty) {
          return emit(LoginFailureState("email is empty"));
        }

        if (password.length < 6) {
          return emit(
              LoginFailureState("Password lenght should be at least 6"));
        }
        // login successful
        await Future.delayed(const Duration(seconds: 2), () {
          return emit(LoginSuccessfulState(msg: "Login successful"));
        });
      } catch (e) {
        return emit(LoginFailureState(e.toString()));
      }
    });
  }
}
