import 'package:flutter/material.dart';
import '../../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kButtonBackgroundColor,
    this.textColor = kForeColorWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _horizontal = 00;
    double _vertical = 20;
    double _borderRadius = 10;
    double _width = kGblButtonWidth;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1.0),
            spreadRadius: -.0,
            blurRadius: 0,
            offset: Offset(0, 04), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.white.withOpacity(1.0),
            spreadRadius: -.0,
            blurRadius: 0,
            offset: Offset(0.5, 0.5), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: size.width * _width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: FlatButton(
          padding: EdgeInsets.symmetric(
              vertical: _vertical, horizontal: _horizontal),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
