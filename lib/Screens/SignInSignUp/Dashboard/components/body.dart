// LoginRegister Body SCREEN BODY
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignUp/signup_screen.dart';
import 'package:SadhanaCard_1/Screens/components/iskcon_logoWidget.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_button.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalFunction globalFunction = GlobalFunction();
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IskconlogoWidget(size: size),
              SizedBox(
                height: size.width * 0.45,
              ),
              // SING IN BUTTON
              RoundedButton(
                text: txtSignIn,
                press: () {
                  globalFunction.route(context, SignInScreen());
                },
              ),
              // SIGN UP BUTTON
              RoundedButton(
                text: txtSignUp,
                color: kRegisterButtonBackgroundColor,
                textColor: kForeColorOrange,
                press: () {
                  globalFunction.route(context, SignUpScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
