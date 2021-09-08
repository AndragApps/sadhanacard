import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/CommanBackground.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/NewPassword/newPassword_screen.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';
import 'package:SadhanaCard_1/Screens/components/ISKCON_LogoWidget.dart';
import 'package:SadhanaCard_1/Screens/components/alreadyHaveAnAccountCheck.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_button.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_inputText.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //  reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  //Function to show message
  GlobalFunction _globalFunction = GlobalFunction();

  //TO SAVE ENTERED VALUE OF LOGIN ID.
  String txtLoginId = "";
  //TO SAVE ENTERED VALUE OF PASSWORD.
  String txtMobileNumber = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double shadowBlurRadius1 = 0.90;
    double shadowBlurRadius2 = 2.0;
    Color shadowColor = kForeColorLightOrange;

    Color textColor = kGblTextColor;
    return Background(
      child: Container(
        height: double.infinity,
        width: size.width,
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
                  txtResetPassword,
                  style: TextStyle(
                    color: textColor,
                    fontSize: size.width * 0.10,
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
              RoundedInputField(
                icon: Icons.person,
                hintText: txtHintTextforName,
                onChanged: (value) {
                  txtLoginId = value.toString();
                },
              ),
              RoundedInputField(
                icon: Icons.phone,
                hintText: txtHintTextforMobileNumber,
                onChanged: (value) {
                  txtMobileNumber = value.toString();
                },
              ),
              RoundedButton(
                text: txtNext,
                press: () {
                  if (txtLoginId.toString().isEmpty ||
                      txtLoginId.trim().length == 0)
                    _globalFunction.msgBox(context, emptyEnterName);
                  else if (txtMobileNumber.toString().isEmpty ||
                      txtMobileNumber.trim().length == 0)
                    _globalFunction.msgBox(context, emptyEnterMobileNumber);
                  else {
                    _authenticateUser(
                        loginId: txtLoginId, mobileNumber: txtMobileNumber);
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

  //UPDATE LOGIN LOGINCREDENTIALS...isLogin = 1 for the existing user.
  void _authenticateUser(
      {String loginId, String password, String mobileNumber}) async {
    final int rowCounter = await dbHelper.authenticateLoginCredentials(
        userName: loginId,
        mobileNumber: mobileNumber,
        isLoginAuthentication: false);

    if (rowCounter == 1) {
      _globalFunction.route(
        context,
        new NewPassword(
          loginId: loginId,
          mobileNumber: mobileNumber,
        ),
      );
    } else {
      _globalFunction.msgBox(context, txtLoginId + " " + userNotFound);
    }
  }
}
