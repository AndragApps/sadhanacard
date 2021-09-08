import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _horizontalPadding = 20;
    double _verticalPadding = 5;
    double _borderRadius = 10;
    double _width = kGblTextWidth;
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
        ),
        width: size.width * _width,
        decoration: BoxDecoration(
          color: kForeColorLightOrange,
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1.0),
              spreadRadius: -.0,
              blurRadius: 0,
              offset: Offset(0, 04), // changes position of shadow offset: Offset(5, 05), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.white.withOpacity(1.0),
              spreadRadius: -.0,
              blurRadius: 0,
              offset: Offset(1, 01), // changes position of shadow
            ),
            
          ],
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
