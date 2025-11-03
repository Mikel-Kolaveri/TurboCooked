import 'package:flutter/widgets.dart';

class AllPadding extends StatelessWidget {
  const AllPadding(this.value, this.child, {super.key});

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

    required this.h,
    required this.v,
    required this.child,
  });

  final double h;
  final double v;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
      child: child,
    );
  }
}

class VPadding extends StatelessWidget {
  const VPadding(this.value, this.child, {super.key});

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
  const HPadding(this.value, this.child, {super.key});

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
  const UpPadding(this.value, this.child, {super.key});

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
  const DownPadding(this.value, this.child, {super.key});

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
  const LeftPadding(this.value, this.child, {super.key});

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
  const RightPadding(this.value, this.child, {super.key});

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
