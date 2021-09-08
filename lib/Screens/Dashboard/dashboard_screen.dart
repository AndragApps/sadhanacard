import 'package:SadhanaCard_1/Screens/Dashboard/components/background.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/components/body.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<DashboardScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kBackgroundColorWhite,
        body: Background(
          child: Body(),
        ),
      ),
    );
  }
}
