import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //O1_TOP ORANGE RIGHT SIDE
            Positioned(
              top: -30.0,
              right: -5,
              child: Image.asset(
                image4,
                height: size.width + (size.width / 3), 
              ),
            ),
            //O2_LOGO
            Positioned(
              top: size.width * 0.35, //150,
              child: Image.asset(
                image2,
                width: size.width,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
