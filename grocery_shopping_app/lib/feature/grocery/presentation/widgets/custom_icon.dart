import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final String? label;

  const CustomIconWidget({required this.icon,
                  this.color,
                  this.label,
                  this.size,
                   super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
           icon, // Icon to be displayed
            size:size, // Size of the icon
            color:color, // Color of the icon
            semanticLabel:label, // Accessibility label
          );
  }
}