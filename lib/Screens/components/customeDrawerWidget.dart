import 'package:SadhanaCard_1/Database/database_helper.dart';
import 'package:SadhanaCard_1/Functions/globalFunctions.dart';
import 'package:SadhanaCard_1/Screens/Dashboard/dashboard_screen.dart';
import 'package:SadhanaCard_1/Screens/SadhanaInformation/sadhanaInformation.dart';
import 'package:SadhanaCard_1/Screens/SignInSignUp/SignIn/login_screen.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  _CustomeDrawerState createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  GlobalFunction _globalFunction = GlobalFunction();
  final dbHelper = DatabaseHelper.instance;
  int widthDivedBy = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  image6,
                  width: (size.width / 4),
                ),
                Text(
                  txtSadhanaCard,
                  style: TextStyle(
                    fontFamily: "TrajanProBold",
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: kForeColorOrange,
            ),
          ),
          ListTile(
            title: Text(
              '$getloginUser' == "" ? "[Loging User Name]" : getloginUser,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: "TrajanProBold",
                color: kBackgroundColorOrange,
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 0.90,
                  ),
                  Shadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 2.0,
                    color: kForeColorLightOrange,
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(item1Name),
            onTap: () {
              _globalFunction.route(context, DashboardScreen());
            },
          ),
          ListTile(
            title: Text(item2Name),
            onTap: () {
              _globalFunction.route(context, SadhanaInformation());
            },
          ),
          ListTile(
            title: Text(item3Name),
            onTap: () {
              _globalFunction.msgBox(context, lableUpcomingfeature);
            },
          ),
          // ListTile(
          //   title: Text(item4Name),
          //   onTap: () {
          //     dbHelper.delete();
          //     _globalFunction.msgBox(context, lableDatabaseDeletedSuccessfully);
          //   },
          // ),
          ListTile(
            title: Text(txtSignOut),
            onTap: () {
              _globalFunction.route(context, SignInScreen());
            },
          ),
        ],
      ),
    );
  }
}
