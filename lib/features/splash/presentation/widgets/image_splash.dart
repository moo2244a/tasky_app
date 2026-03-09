import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
  });
  final double width;
  final double height;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(fit: .fill, image: AssetImage(imagePath)),
      ),
    );
  }
}
