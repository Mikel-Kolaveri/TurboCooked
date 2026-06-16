import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/widgets/my_network_image.dart';

class MyNetworkAvatar extends StatelessWidget {
  const MyNetworkAvatar(
    this.url, {
    super.key,
    required this.radius,
    this.borderColor,
    this.borderWidth = 1.5,
  });

  final String url;
  final double radius;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    Widget avatar = Container(
      width: radius * 2,
      height: radius * 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(shape: BoxShape.circle, color: mc.bg),
      child: MyNetworkImage(url),
    );

    if (borderColor != null) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor!, width: borderWidth),
        ),
        child: avatar,
      );
    }

    return avatar;
  }
}
