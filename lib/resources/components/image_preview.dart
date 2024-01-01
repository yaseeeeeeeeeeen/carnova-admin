import 'package:carnova_webapp/resources/api_urls.dart/api_urls.dart';
import 'package:flutter/material.dart';

class ImagePreviewWid extends StatelessWidget {
  ImagePreviewWid({super.key, required this.imageUrl});
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(30),
      width: w,
      height: h,
      child: Image(
          image: NetworkImage("${Url.baseUrl}/$imageUrl"), fit: BoxFit.cover),
    );
  }
}
