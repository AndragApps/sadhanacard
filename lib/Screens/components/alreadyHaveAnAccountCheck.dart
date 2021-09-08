import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  final Function pressToResetPwd;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
    this.pressToResetPwd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              login ? lableDontHaveAnAccount : lableAlreadyHaveAnAccount,
              style: TextStyle(
                color: kForeColorOrange,
              ),
            ),
            GestureDetector(
              onTap: press,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 3, 5, 3),
                child: Text(
                  login ? txtSignUp : txtSignIn,
                  style: TextStyle(
                      color: kForeColorOrange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              login ? lableForgotPassword : "",
              style: TextStyle(
                color: kForeColorOrange,
              ),
            ),
            GestureDetector(
              onTap: pressToResetPwd,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 3, 5, 3),
                child: Text(
                  login ? lableResetHere : "",
                  style: TextStyle(
                      color: kForeColorOrange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
