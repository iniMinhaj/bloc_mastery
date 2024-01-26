import 'package:auth_validation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = "";
    String? password;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error.toString())));
          }

          if (state is LoginSuccessfulState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg.toString())));
          }

          if (state is AuthLoading) {
            print("Loading....");
            CircularProgressIndicator();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  print(email);
                  print(password);
                  context.read<AuthBloc>().add(LoginEvent(
                      email: email.toString(), password: password.toString()));
                },
                child: Container(
                  height: 48,
                  width: 120,
                  color: Colors.red,
                  child: const Center(child: Text("Login")),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 140,
                      color: Colors.blueAccent,
                      child: const Center(child: Text("Login With Gmail")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
