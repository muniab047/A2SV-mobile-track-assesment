import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomElevatedButtonWidget extends StatelessWidget {

  final Color? backgroundColor, overlayColor, foregroundColor, shadowColor, borderColor, textColor;
  final double? elevation, borderRadius;
  final EdgeInsets? padding;
  final String text;
  final VoidCallback? onPressed;

  const CustomElevatedButtonWidget({this.backgroundColor,
                                    this.borderColor,
                                    this.borderRadius, 
                                    this.elevation, 
                                    this.foregroundColor, 
                                    this.overlayColor, 
                                    this.padding, 
                                    this.shadowColor,
                                    required this.text,
                                    this.onPressed,
                                    this.textColor,
                                    super.key});

  @override
  Widget build(BuildContext context) {

    double ratio(double num){
      return num * MediaQuery.of(context).size.width / 400;

    }

   return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor), // Background color
          foregroundColor: WidgetStatePropertyAll(foregroundColor), // Text and icon color
          overlayColor:  WidgetStatePropertyAll(overlayColor), // Splash color
          shadowColor: WidgetStatePropertyAll(shadowColor), // Shadow color
          elevation: WidgetStatePropertyAll(elevation), // Elevation
          padding: WidgetStatePropertyAll(padding),
           // Padding
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 3), // Rounded corners
              side: BorderSide(color: borderColor ?? Colors.transparent), // Border
            ),
          ),
          
        ),
        child: CustomTextWidget(
          text: text,
          family: 'Poppins',
          size: ratio(12),
          weight: FontWeight.w600,
          color: textColor,
          ),
      );
  }
}


////// elevated button



class CustomOutlinedButtonWidget extends StatelessWidget {

  final Color? backgroundColor,foregroundColor, borderColor, textColor;
  final double? borderRadius, borderWidth;
  final EdgeInsets? padding;
  final String text;
  final VoidCallback? onPressed;

  const CustomOutlinedButtonWidget({this.backgroundColor,
                                    this.borderColor,
                                    this.borderRadius, 
                                    this.foregroundColor, 
                                    this.padding,
                                    this.borderWidth,
                                    required this.text,
                                    this.textColor,
                                    this.onPressed,
                                    super.key});

  @override
  Widget build(BuildContext context) {
    double ratio(double num){
      return num * MediaQuery.of(context).size.width / 400;

    }
    return OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: foregroundColor, // Text color
              backgroundColor: backgroundColor, // Background color
              side: BorderSide(color: borderColor ?? Colors.black, width: borderWidth ?? 2), // Border color and width
              padding: padding, // Padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 3), // Rounded corners
              ),
              
            ),
            child: CustomTextWidget(
              text: text,
              color: textColor,
              size: ratio(12),
              weight: FontWeight.w600,
              ),
          );
  }
}


class CustomIconButtonWidget extends StatelessWidget {

final Color? color, splashColor, highlightColor;
final EdgeInsets? padding;
final String? tooltip;
final double? size;
final IconData icon;
final VoidCallback onPressed;

  const CustomIconButtonWidget({this.color,
                                this.highlightColor,
                                this.padding,
                                this.size,
                                this.splashColor,
                                this.tooltip,
                                required this.icon,
                                required this.onPressed,
                                super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: Icon(icon), // Icon to be displayed
            onPressed: onPressed,
            color: color, // Color of the icon
            iconSize: size, // Size of the icon
            tooltip: tooltip, // Tooltip message
            splashColor: splashColor ?? Colors.transparent.withOpacity(0.5), // Splash color
            highlightColor: highlightColor ?? Colors.transparent.withOpacity(0.5), // Highlight color
            padding: padding, // Padding around the icon
          );
  }
}


class CustomTextButtonWidget extends StatelessWidget {

  final Color? backgroundColor,foregroundColor, borderColor;
  final double? borderRadius, borderWidth;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final String text;
  
  const CustomTextButtonWidget({this.backgroundColor,
                                    this.borderColor,
                                    this.borderRadius, 
                                    this.foregroundColor, 
                                    this.padding,
                                    this.borderWidth,
                                    this.onPressed,
                                    required this.text,
                                    super.key});


  @override
  Widget build(BuildContext context) {
    return TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: foregroundColor, // Text color
              backgroundColor: backgroundColor, // Background color
              padding: padding, // Padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 3), // Rounded corners
              ),
              
            ),
            child: CustomTextWidget(
              text: text),
          );
  }
}