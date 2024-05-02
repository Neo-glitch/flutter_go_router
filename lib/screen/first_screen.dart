import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("First Screen"),
        backgroundColor: Color(0xFF000A1F),
        centerTitle: true,
      ),
      body: Center(
        child: CupertinoButton.filled(
          child: Text("Nav to Second Screen"),
          onPressed: () {
            context.goNamed("second_screen",
                extra: {"firstArg": "Neo", "secondArg": "The Flutter dev"});
          },
        ),
      ),
    );
  }
}
