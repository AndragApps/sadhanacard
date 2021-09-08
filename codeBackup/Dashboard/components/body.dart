// LoginRegister Body SCREEN BODY
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignUp/signup_screen.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_button.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // SING IN BUTTON
              RoundedButton(
                text: "Sign In",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ),
                  );
                },
              ),
              // REGISTER BUTTON
              RoundedButton(
                text: "Sign Up",
                color: kRegisterButtonBackgroundColor,
                textColor: kForeColorOrange,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.width * 0.35,
              ),
            ],
          ),
          // padding: EdgeInsets.symmetric(vertical: 150),
        ),
      ),
    );
  }
}
