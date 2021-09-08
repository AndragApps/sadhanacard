//SIGN IN SCREEN BODY
import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/dashboard_screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/CommanBackground.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/ResetPassword/resetPassword_screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignUp/signup_screen.dart';
import 'package:SadhanaCard_1/Screens/components/alreadyHaveAnAccountCheck.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_button.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_inputText.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_passwordField.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'banner.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
// reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  //Function to show message
  GlobalFunction _globalFunction = GlobalFunction();

  //TO SAVE ENTERED VALUE OF LOGIN ID.
  String txtLoginId = "";
  //TO SAVE ENTERED VALUE OF PASSWORD.
  String txtPassword = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double shadowBlurRadius1 = 0.90;
    double shadowBlurRadius2 = 2.0;
    Color shadowColor = kForeColorLightOrange;

    Color textColor = kGblTextColor;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BannerWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Text(
                txtSignIn,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: textColor,
                  fontSize: size.width * 0.11,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: shadowBlurRadius1,
                    ),
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: shadowBlurRadius2,
                      color: shadowColor,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 7)
            ],
          ),
          RoundedInputField(
            icon: Icons.people,
            hintText: txtHintTextforName,
            onChanged: (value) {
              txtLoginId = value.toString();
            },
          ),
          RoundedPasswordField(
            onChange: (value) {
              txtPassword = value.toString();
            },
          ),
          RoundedButton(
            text: txtSignIn,
            press: () {
              if (txtLoginId.toString().isEmpty || txtLoginId.trim().length == 0)
                _globalFunction.msgBox(context, emptyEnterName);
              else if (txtPassword.toString().isEmpty || txtPassword.trim().length == 0)
                _globalFunction.msgBox(context, emptyEnterPassword);
              else
                _authenticateUser(txtLoginId, txtPassword);
            },
          ),
          SizedBox(
            height: 20,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              _globalFunction.route(context, SignUpScreen());
            },
            pressToResetPwd: () {
              _globalFunction.route(context, ResetPassword());
            },
          ),
          SizedBox(
            height: size.height * 0.10,
          ),
        ],
      ),
    );
  }

  //UPDATE LOGIN LOGINCREDENTIALS...isLogin = 1 for the existing user.
  void _authenticateUser(String loginId, String password) async {
    final int rowCounter = await dbHelper.authenticateLoginCredentials(
        userName: loginId, password: password);

    if (rowCounter == 0) {
      _globalFunction.msgBox(context, invalidUserOrPassword);
      return;
    }
    setloginUser = txtLoginId;
    _globalFunction.route(context, DashboardScreen());
  }
}
