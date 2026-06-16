import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_colors.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage(
    this.url, {
    super.key,
    this.height,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.errorIconColor,
  });

  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? backgroundColor;
  final Color? errorIconColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? mc.bg;
    final iconColor = errorIconColor ?? mc.pinkMain;

    return Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return Container(
          height: height,
          width: width,
          color: bgColor,
          child: Center(child: CircularProgressIndicator(color: iconColor)),
        );
      },
      errorBuilder: (_, __, ___) => Container(
        height: height,
        width: width,
        color: bgColor,
        child: Icon(Icons.broken_image_outlined, color: iconColor),
      ),
    );
  }
}
