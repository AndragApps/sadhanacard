import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

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
                image1,
                width: size.width,
                height: size.height,
              ),
            ),
            Positioned(
              top: size.height - (size.height * 1.25),
              right: 0,
              child: Image.asset(
                image2,
                width: size.width,
                height: size.height,
              ),
            ),
            Positioned(
              bottom: size.height - (size.height * 0.965),
              child: CircularProgressIndicator(
                backgroundColor: kBackgroundColorWhite,
                strokeWidth: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
