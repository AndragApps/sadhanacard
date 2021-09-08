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
    // double fontSize = 30;
    double fontSize = (size.width * 0.045);
    double fontSizeOftext1 = 10;
    double fontSizeOftext2 = -10;
    double fontSizeOftext3 = 10;
    double fontSizeOftext4 = -10;
    double fontSizeOftext5 = 10.00;
    double sizedBoxHeight = 10;
    double shadowBlurRadius1 = 0.50;
    double shadowBlurRadius2 = 10.0;
    Color shadowColor = kForeColorLightOrange;
    Color textColor = Colors.black;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //TOP_O1
          Positioned(
            top: -30.0,
            right: -5,
            child: Image.asset(
              "assets/images/xd/picture1LeftSide.png",
              height: size.width + (size.width / 3),
            ),
          ),
          Container(
            width: size.width,
            height: size.width,
            alignment: Alignment.topCenter,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //text1
                Text(
                  "WELCOME",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize + fontSizeOftext1,
                    fontFamily: kGblFontFamily,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 5,
                    letterSpacing: 5,
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
                SizedBox(
                  height: sizedBoxHeight,
                ),
                //text2
                Text(
                  "TO",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize + fontSizeOftext2,
                    fontFamily: kGblFontFamily,
                    wordSpacing: 5,
                    letterSpacing: 5,
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
                SizedBox(
                  height: sizedBoxHeight,
                ),
                //text3
                Text(
                  "THE JOURNEY",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize + fontSizeOftext3,
                    fontWeight: FontWeight.bold,
                    fontFamily: kGblFontFamily,
                    wordSpacing: 5,
                    letterSpacing: 5,
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
                SizedBox(
                  height: sizedBoxHeight,
                ),
                //text4
                Text(
                  "OF",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize + fontSizeOftext4,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 5,
                    letterSpacing: 5,
                    fontFamily: kGblFontFamily,
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
                SizedBox(
                  height: sizedBoxHeight,
                ),

                //text5
                Text(
                  "SELF DISCOVERY",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize + fontSizeOftext5,
                    fontWeight: FontWeight.bold,
                    fontFamily: kGblFontFamily,
                    wordSpacing: 5,
                    letterSpacing: 5,
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
              ],
            ),
          ),
          Positioned(
            top: size.width * 0.35, //150,
            child: Image.asset(
              "assets/images/JOSD_Logo.png",
              width: size.width,
            ),
          ),
          //BOTTOM_02
          Positioned(
            bottom: -size.width * 0.35, //150,
            left: size.width - (size.width * 1.85),
            child: Image.asset(
              "assets/images/xd/4_launchScreen/Rectangle 3.png",
              width: size.width,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
