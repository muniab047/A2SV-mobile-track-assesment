import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String? family;
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextOverflow? overflow;

  const CustomTextWidget({super.key, 
                          this.family, 
                          this.size, 
                          required this.text, 
                          this.color, 
                          this.weight,
                          this.overflow});

  @override
  Widget build(BuildContext context) {
    
    return Text(
      
       text, 
        maxLines: null ,
        overflow: overflow,
        style: TextStyle(
        fontFamily: family,
        fontSize: size ,
        color: color?? Colors.black,
        fontWeight: weight, ),);
  }
}