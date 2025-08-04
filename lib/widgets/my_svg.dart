import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MySvg extends StatelessWidget {
  const MySvg(this.asset, {super.key, this.onTap, this.height});
  final String asset;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(asset, height: height),
    );
  }
}
