//SIGN IN SCREEN BODY
import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/CommanBackground.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';
import 'package:SadhanaCard_1/Screens/components/ISKCON_LogoWidget.dart';
import 'package:SadhanaCard_1/Screens/components/alreadyHaveAnAccountCheck.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_button.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_inputText.dart';
import 'package:SadhanaCard_1/Screens/components/rounded_passwordField.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  GlobalFunction _globalFunction = GlobalFunction();

  //TO SAVE ENTERED VALUE OF LOGIN ID.
  String txtName = "";
  //TO SAVE ENTERED VALUE OF PASSWORD.
  String txtContactNo = "";
  //TO SAVE ENTERED VALUE OF LOGIN ID.
  String txtPassword = "";
  //TO SAVE ENTERED VALUE OF PASSWORD.
  String txtConfirmPassword = "";

  //Flag for the User exist or not.
  // static bool _isNewUser = false;
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
                height: size.height * 0.01,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                width: size.width,
                child: Text(
                  txtSignUpPageTitle,
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
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                  vertical: 10,
                ),
              ),
              RoundedInputField(
                icon: Icons.person,
                hintText: txtHintTextforName,
                textInputType: TextInputType.name,
                onChanged: (value) {
                  txtName = value;
                },
              ),
              RoundedInputField(
                icon: Icons.phone,
                hintText: txtHintTextforMobileNumber,
                textInputType: TextInputType.number,
                onChanged: (value) {
                  txtContactNo = value;
                },
              ),
              RoundedPasswordField(
                onChange: (value) {
                  txtPassword = value;
                },
              ),
              RoundedPasswordField(
                textInputType: TextInputType.visiblePassword,
                isPasswordHidden: false,
                onChange: (value) {
                  txtConfirmPassword = value;
                },
                icon: Icons.lock_open,
                hintText: txtHintTextforConfirmPassword,
              ),
              RoundedButton(
                text: txtSignUp,
                press: () {
                  if (txtName.toString().isEmpty ||
                      txtName.trim().length == 0) {
                    _globalFunction.msgBox(context, emptyEnterName);
                  } else if (txtContactNo.toString().isEmpty ||
                      txtContactNo.trim().length < 8 ||
                      txtContactNo.trim().length > 11) {
                    if (txtContactNo.trim().length < 8) {
                      _globalFunction.msgBox(
                          context, emptyEnterNewZealandMobileNumber);
                    } else if (txtContactNo.trim().length > 11) {
                      _globalFunction.msgBox(
                          context, emptyEnterNewZealandMobileNumber);
                    } else
                      _globalFunction.msgBox(context, emptyEnterMobileNumber);
                  } else if (txtPassword.toString().isEmpty ||
                      txtPassword.trim().length == 0) {
                    _globalFunction.msgBox(context, emptyEnterPassword);
                  } else if (txtConfirmPassword.toString().isEmpty ||
                      txtConfirmPassword != txtPassword ||
                      txtConfirmPassword.trim().length == 0) {
                    if (txtConfirmPassword.toString().isEmpty ||
                        txtConfirmPassword.trim().length == 0)
                      _globalFunction.msgBox(context, emptyConfirmPassword);
                    else
                      _globalFunction.msgBox(context, passwordNotMatch);
                  } else {
                    //check user Exist or not.
                    _isUserRegistered(
                        txtName); //update _isNewUser to true is new else flase.
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

  //INSERT NEW USER.
  void _insert() async {
    DateFormat dateFormater = new DateFormat.yMMMd(); //Sep, 30 2020
    Map<String, dynamic> row = {
      DatabaseHelper.colLCname: txtName,
      DatabaseHelper.colLCmobile: txtContactNo,
      DatabaseHelper.colLCpassword: txtPassword,
      DatabaseHelper.colLCisLogin: "0",
      DatabaseHelper.colLCregDate: dateFormater.format(DateTime.now()),
    };
    await dbHelper.insertIntoTableLoginCredentials(row);
  }

  void _isUserRegistered(String userName) async {
    final int rowCounter =
        await dbHelper.queryGetRowFromTableLoginCredentials(userName);
    if (rowCounter == 0) {
      _insert();
      _globalFunction.route(context, SignInScreen());
    } else {
      _globalFunction.msgBox(context, txtName + " already registered.");
    }
  }
}
