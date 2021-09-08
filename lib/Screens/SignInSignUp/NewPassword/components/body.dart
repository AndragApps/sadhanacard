import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/CommanBackground.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';

import 'package:SadhanaCard_1/Screens/components/ISKCON_LogoWidget.dart';
import 'package:SadhanaCard_1/Screens/components/alreadyHaveAnAccountCheck.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_button.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_passwordField.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
    this.updateLoginId,
    this.updateMobileNumber,
  }) : super(key: key);

  final String updateLoginId;
  final String updateMobileNumber;

  @override
  _BodyState createState() => _BodyState(
        updateLoginId: updateLoginId,
        updateMobileNumber: updateMobileNumber,
      );
}

class _BodyState extends State<Body> {
  _BodyState({
    this.updateLoginId,
    this.updateMobileNumber,
  });
  final String updateLoginId;
  final String updateMobileNumber;

//  reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

//Function to show message
  GlobalFunction _globalFunction = GlobalFunction();

  String txtPassword = "";

  String txtConfirmPassword = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double shadowBlurRadius1 = 0.90;
    double shadowBlurRadius2 = 2.0;
    Color shadowColor = kForeColorLightOrange;
    GlobalFunction _globalFunction = GlobalFunction();
    Color textColor = kGblTextColor;
    return Background(
      child: Container(
        height: double.infinity, //size.height,
        width: size.width,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: IskconlogoWidget(size: size * 0.7),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                width: size.width,
                child: Text(
                  txtConfigurePassword,
                  style: TextStyle(
                    color: textColor,
                    fontSize: size.width * 0.07,
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
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                  vertical: 10,
                ),
              ),
              RoundedPasswordField(
                onChange: (value) {
                  txtPassword = value.toString();
                },
              ),
              RoundedPasswordField(
                onChange: (value) {
                  txtConfirmPassword = value.toString();
                },
                icon: Icons.lock_open,
                hintText: txtConfigurePassword,
              ),
              RoundedButton(
                text: txtUpdate,
                press: () {
                  if (txtPassword.toString().isEmpty ||
                      txtPassword.trim().length == 0) {
                    _globalFunction.msgBox(context, emptyEnterName);
                    return;
                  } else if (txtConfirmPassword.toString().isEmpty ||
                      txtConfirmPassword.trim().length == 0) {
                    _globalFunction.msgBox(context, emptyEnterMobileNumber);
                    return;
                  } else {
                    updateLoginCredentials(
                        password: txtPassword,
                        confirmPassword: txtConfirmPassword,
                        loginId: updateLoginId);
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  _globalFunction.route(context, SignInScreen());
                },
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateLoginCredentials(
      {String password, String confirmPassword, String loginId}) async {
    Map<String, dynamic> row = {
      DatabaseHelper.colLCname: loginId,
      DatabaseHelper.colLCpassword: password,
    };

    if (txtPassword.toString().isEmpty || txtPassword.trim().length == 0) {
      _globalFunction.msgBox(context, emptyEnterPassword);
      return;
    } else if (txtConfirmPassword.toString().isEmpty ||
        txtConfirmPassword != txtPassword) {
      if (txtConfirmPassword.toString().isEmpty ||
          txtConfirmPassword.trim().length == 0) {
        _globalFunction.msgBox(context, emptyConfirmPassword);
      } else
        _globalFunction.msgBox(context, passwordNotMatch);
    } else {
      await dbHelper.updateTableLoginCredentials(row);
      _globalFunction.route(context, SignInScreen());
    }
  }
}
