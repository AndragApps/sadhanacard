import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomeSliverHeader extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String headerTitle, imagePath;
  final Size size;
  CustomeSliverHeader(
    this.backgroundColor,
    this.headerTitle,
    this.textColor,
    this.imagePath,
    this.size,
  );

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(backgroundColor, headerTitle, textColor, imagePath),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor, textColor;
  final String headerTitle;
  final String imagePath;
  double _sizedBox = 20;
  double _extent = 70;
  Delegate(
      this.backgroundColor, this.headerTitle, this.textColor, this.imagePath);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: GestureDetector(
        onTap: () {
          print(headerTitle.toString() + " tapped.");
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: -0.0,
                blurRadius: 0,
                offset: Offset(0,
                    00), // changes position of shadow offset: Offset(5, 05), // changes position of shadow
              ),
              BoxShadow(
                color: backgroundColor,
                spreadRadius: -0.0,
                blurRadius: 0,
                offset: Offset(0, 00), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: _sizedBox,
                  ),
                  // HeaderText
                  Icon(Icons.blur_on,color: kBackgroundColorOrange,),
                  SizedBox(width: _sizedBox - 5,),
                  Text(
                    headerTitle,
                    style: TextStyle(
                  
                      color: kBackgroundColorOrange, //textColor,
                      // fontFamily: "TrajanProBold",
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      wordSpacing: 5,
                      letterSpacing: 5,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 1.5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => _extent;
  
  @override
  double get minExtent => _extent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
