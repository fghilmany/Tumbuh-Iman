import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';

class IconCustom extends StatelessWidget {
  final IconData? icon;
  final String? iconPath; // Path to SVG/PNG
  final double? size;
  final Color? color;

  const IconCustom({
    super.key,
    this.icon,
    this.iconPath,
    this.size,
    this.color,
  }) : assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');

  @override
  Widget build(BuildContext context) {
    if (iconPath != null) {
      return ImageCustom(
        path: iconPath!,
        width: size ?? 24,
        height: size ?? 24,
        color: color,
      );
    } else {
      return Icon(
        icon!,
        size: size ?? 24,
        color: color,
      );
    }
  }
}