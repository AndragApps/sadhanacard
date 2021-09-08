import 'package:SadhanaCard_1/Screens/SignInSignUp/NewPassword/components/body.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  NewPassword({
    this.loginId,
    this.mobileNumber,
  });

  final String loginId;
  final String mobileNumber;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Body(
          updateLoginId: loginId,
          updateMobileNumber: mobileNumber,
        ),
      ),
    );
  }
}
