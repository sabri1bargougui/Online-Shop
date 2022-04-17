import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

class EmptyWidgetScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final double? fontsizetitle;
  final double? fontsizeSubTitle;

  const EmptyWidgetScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.fontsizetitle,
    this.fontsizeSubTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyWidget(
      image: imageUrl != null ? imageUrl : null,
      packageImage: imageUrl != null ? null : PackageImage.Image_1,
      title: title,
      subTitle: subtitle,
      titleTextStyle: TextStyle(
        fontSize: fontsizeSubTitle == null ? 22 : fontsizetitle,
        color: Color(0xff9da9c7),
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: fontsizeSubTitle == null ? 14 : fontsizeSubTitle,
        color: Color(0xffabb8d6),
      ),
    );
  }
}
