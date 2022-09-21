import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Flushbar flushBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: blueButton("Show a Flush Bar", () {
          showFlushBar(context, "Message Content");
        }),
      ),
    ));
  }

  showFlushBar(BuildContext context, String message) async {
    flushBar = Flushbar(
      title: "Title",
      titleColor: Colors.white,
      message: message,
      messageColor: Colors.white,
      duration: const Duration(seconds: 6),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticInOut,
      backgroundColor: const Color(0xff376c93),
      boxShadows: const [
        BoxShadow(
          color: Colors.green,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      isDismissible: false,
      icon: const Icon(
        Icons.report,
        color: Colors.white,
      ),
      mainButton: Column(
        children: [
          redButton("Cancel", () {
            Navigator.pop(context);
          }),
          Row(
            children: [
              greenButton("Action 1", () {}),
              const SizedBox(
                width: 8,
              ),
              pinkButton("Action 2", () {})
            ],
          )
        ],
      ),
    )..show(context);
  }

  blueButton(String label, Function() fun) {
    return ElevatedButton(
      onPressed: () {
        fun();
      },
      child: Text(label),
    );
  }

  redButton(String label, Function() fun) {
    return ElevatedButton(
      onPressed: () {
        fun();
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
          primary: Colors.red.shade400, padding: EdgeInsets.zero),
    );
  }

  greenButton(String label, Function() fun) {
    return ElevatedButton(
      onPressed: () {
        fun();
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
          primary: Colors.green.shade400, padding: EdgeInsets.zero),
    );
  }

  pinkButton(String label, Function() fun) {
    return ElevatedButton(
      onPressed: () {
        fun();
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
          primary: Colors.pink.shade400, padding: EdgeInsets.zero),
    );
  }
}
