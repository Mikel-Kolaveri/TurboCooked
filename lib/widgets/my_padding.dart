import 'package:flutter/widgets.dart';

class AllPadding extends StatelessWidget {
  const AllPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(value), child: child);
  }
}

class SymPadding extends StatelessWidget {
  const SymPadding({
    super.key,
    required this.child,
    required this.h,
    required this.v,
  });

  final Widget child;
  final double h;
  final double v;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
      child: child,
    );
  }
}

class VPadding extends StatelessWidget {
  const VPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: child,
    );
  }
}

class HPadding extends StatelessWidget {
  const HPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: child,
    );
  }
}

class UpPadding extends StatelessWidget {
  const UpPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: child,
    );
  }
}

class DownPadding extends StatelessWidget {
  const DownPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: child,
    );
  }
}

class LeftPadding extends StatelessWidget {
  const LeftPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: child,
    );
  }
}

class RightPadding extends StatelessWidget {
  const RightPadding(this.child, this.value, {super.key});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: child,
    );
  }
}
