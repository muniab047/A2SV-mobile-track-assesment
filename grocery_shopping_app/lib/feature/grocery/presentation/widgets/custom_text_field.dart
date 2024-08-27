import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final double? sizedBox,  maxWidth, maxHeight;
  final Color? enableBorderColor, focusedBorderColor, fillColor;
  final int?  maxLines;
  final String label;
  final ValueChanged? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter> ? inputFormatter;
  final TextEditingController? controller;
  
  
  
  const CustomTextFieldWidget({this.enableBorderColor,
                        this.fillColor,
                        this.focusedBorderColor,
                        this.maxLines,
                        this.maxWidth,
                        this.sizedBox,
                        required this.label,
                        this.maxHeight,
                        this.onChanged,
                        this.textInputType,
                        super.key, this.inputFormatter, this.controller});

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 400;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        CustomTextWidget(text: label,
            family: 'Poppins',
            weight: FontWeight.w500,
            size: ratio(12),
            color: const Color(0XFF3E3E3E),
        ),
       
        SizedBox(height: sizedBox),
        TextFormField(
          controller: controller,
          
          maxLines: maxLines,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: enableBorderColor ?? Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              border: const OutlineInputBorder(),
              fillColor: fillColor,
              filled: true,
              constraints: BoxConstraints(
                maxWidth: maxWidth ?? double.infinity,
                maxHeight: maxHeight ?? 40,
                
                
              )),
          onChanged: onChanged,
        )
      ],
    );
  }
}
