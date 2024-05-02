import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(
      {super.key, required this.firstArg, required this.secondArg});

  final String firstArg;
  final String secondArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // this doesn't add a new screen to the
              // back stack since it's current screen, so it just replaces with new arg
              context.goNamed(
                "second_screen",
                extra: {
                  "firstArg": "Neo Refreshed",
                  "secondArg": "The Flutter dev Refreshed"
                },
              );
            },
            icon: const Icon(Icons.refresh),
          )
        ],
        foregroundColor: Colors.white,
        title: Text("Second Screen"),
        backgroundColor: Color(0xFF000A1F),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "First Argument passed is: $firstArg",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Second Argument passed is: $secondArg",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
