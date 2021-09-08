import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class IskconlogoWidget extends StatelessWidget {
  const IskconlogoWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.width * 0.25,
          ),
          Image.asset(
            image6,
            width: size.width - (size.width / 3),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Image.asset(
            image7,
            width: size.width,
          ),
        ],
      ),
    );
  }
}
