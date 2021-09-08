import 'package:flutter/material.dart';

class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget({
    Key key,
    this.imagePath,
    @required this.isBorderVisible,
  }) : super(key: key);

  @required
  final String imagePath;
  final bool isBorderVisible;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Container(
        decoration: new BoxDecoration(
          border: isBorderVisible == false
              ? (null)
              : (Border.all(width: 2.5, color: Colors.black)),
          shape: BoxShape.rectangle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
