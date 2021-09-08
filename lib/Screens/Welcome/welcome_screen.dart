import 'dart:async';

import 'package:SadhanaCard_1/Screens/Dashboard/dashboard_screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/Dashboard/LoginRegister_Screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';
import 'package:SadhanaCard_1/Screens/Welcome/components/body copy.dart';
import 'package:flutter/material.dart';
import 'package:SadhanaCard_1/constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: kLaunchScreenTimerSeconds);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            direcLogin == false ? SignInSignUpScreen() : DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => {
            route(),
          },
          child: Body(),
        ),
      ),
    );
  }
}
