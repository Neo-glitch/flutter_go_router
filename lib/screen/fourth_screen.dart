import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Fourth Screen"),
        backgroundColor: Color(0xFF000A1F),
        centerTitle: true,
      ),
    );
  }
}
