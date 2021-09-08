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

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //OBJECT - 1
          Positioned(
            top: -30.0,
            right: -5,
            child: Image.asset(
              image4,
              height: size.width + (size.width / 3),
            ),
          ),
          //OBJECT - 2
          Positioned(
            bottom: -size.width * 0.35, //150,
            left: size.width - (size.width * 1.85),
            child: Image.asset(
              image5,
              width: size.width,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
