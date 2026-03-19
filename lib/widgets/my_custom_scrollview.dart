import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({
    super.key,
    required this.header,
    required this.headerHeight,
    required this.children,
    this.bgColor,
  });
  final Widget header;
  final double headerHeight;
  final List<Widget> children;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    Widget current = CustomScrollView(
      slivers: <Widget>[
        m.SliverAppBar(
          leading: const SizedBox(),
          flexibleSpace: m.FlexibleSpaceBar(background: header),
          expandedHeight: headerHeight,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            return children[index];
          }, childCount: children.length),
        ),
      ],
    );

    return current;
  }
}
