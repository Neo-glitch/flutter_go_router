import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Login Screen"),
        backgroundColor: Color(0xFF000A1F),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
                child: Text("Go Home"),
                onPressed: () {
                  context.goNamed("first_screen");
                }),
            SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
                child: Text("Login"),
                onPressed: () {
                  context.read<LoginCubit>().login();
                })
          ],
        ),
      ),
    );
  }
}
