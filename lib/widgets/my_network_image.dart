import 'package:cached_network_image/cached_network_image.dart';
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

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (_, __) => Container(
        height: height,
        width: width,
        color: bgColor,
        child: Center(child: CircularProgressIndicator(color: iconColor)),
      ),
      errorWidget: (_, __, ___) => Container(
        height: height,
        width: width,
        color: bgColor,
        child: Icon(Icons.broken_image_outlined, color: iconColor),
      ),
    );
  }
}
