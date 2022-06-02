// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_string_escapes

// ignore: avoid_web_libraries_in_flutter, unused_import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mp_sidesa_surat/ui/login_screen.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, LoginRoute);
  }

  // ignore: non_constant_identifier_names
  LoginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 4, 108, 243),
                gradient: LinearGradient(colors: const [
                  (Color.fromARGB(255, 4, 108, 243)),
                  (Color.fromARGB(255, 108, 164, 237))
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Image.asset('images/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
