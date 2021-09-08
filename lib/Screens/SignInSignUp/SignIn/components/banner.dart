import 'package:SadhanaCard_1/Screens/components/imageViewer_Widget.dart';
import 'package:flutter/material.dart';
import 'package:SadhanaCard_1/constants.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //For the Image Banner...Start
  int currentPage = 0;
  List<Map<String, String>> images = [
    {"imagePath": slideShowImage1},
    {"imagePath": slideShowImage2},
    {"imagePath": slideShowImage3},
    {"imagePath": slideShowImage4},
    {"imagePath": slideShowImage5},
  ];
  //For the Image Banner...ends

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      width: size.width * 0.5,

      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.05),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: images.length,
              itemBuilder: (context, index) => ImageViewerWidget(
                imagePath: images[index]["imagePath"],
                isBorderVisible: index == 2 ? false : true,
              ),
            ),
          ),
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => buildDots(index: index),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDots({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 6,
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? kBackgroundColorOrange
            : kForeColorLightOrange,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
