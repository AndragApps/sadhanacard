import 'package:SadhanaCard_1/Screens/SignInSignUp/Dashboard/components/background.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/Dashboard/components/body.dart';
import 'package:flutter/material.dart';
import 'package:SadhanaCard_1/constants.dart';


class SignInSignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SignInSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColorWhite,
      body: Background(
        child: Body(),
      ),
    );
  }
}

