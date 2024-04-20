import 'package:flutter/material.dart';

import 'package:dustbin_server/ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-time Data App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Users Requested for Pick-Up",
            style: TextStyle(color: Color.fromARGB(255, 244, 244, 244)),
          ),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        ),
        backgroundColor: const Color(0xFF1B1212),
        body: const UI(),
      ),
    );
  }
}
