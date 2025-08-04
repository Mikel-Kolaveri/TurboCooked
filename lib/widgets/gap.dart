import 'package:flutter/widgets.dart';

class GapV extends StatelessWidget {
  const GapV(this.size, {super.key}) : isSpacer = false;
  const GapV.spacer(this.size, {super.key}) : isSpacer = true;

  final double size;
  final bool isSpacer;

  @override
  Widget build(BuildContext context) {
    Widget current = SizedBox(height: size);
    if (!isSpacer) return current;

    return Expanded(child: current);
  }
}

class GapH extends StatelessWidget {
  const GapH(this.size, {super.key}) : isSpacer = false;
  const GapH.spacer(this.size, {super.key}) : isSpacer = true;

  final double size;
  final bool isSpacer;

  @override
  Widget build(BuildContext context) {
    Widget current = SizedBox(width: size);
    if (!isSpacer) return current;

    return Expanded(child: current);
  }
}

class GapBottom extends StatelessWidget {
  const GapBottom({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size ?? 32);
  }
}
