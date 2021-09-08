import 'package:SadhanaCard_1/Screens/components/iskcon_logoWidget.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColorWhite,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -25,
              right: 0,
              child: Image.asset(
                image3,
                width: size.width,
                height: size.height,
              ),
            ),
            Container(
              child:IskconlogoWidget(size: size), 
            ),
            Positioned(
              bottom: size.height - (size.height * 0.965),
              child: SpinKitCircle(
                color: kBackgroundColorOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
