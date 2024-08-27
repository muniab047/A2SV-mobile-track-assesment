import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final double? width, height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final String image;

  const ProductImageWidget({this.width,
                  this.borderRadius,
                  this.boxShadow,
                  this.fit,
                  this.height,
                  required this.image,
                  super.key});

  
 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0) ,
        child: Image.network(image, fit: fit)));
        //child: Image.asset('assets/images/image.png', fit: fit)));
  }
}