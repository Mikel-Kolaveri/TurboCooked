import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_svg.dart';

class MyNavigationBar extends ConsumerStatefulWidget {
  const MyNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyNavigationBarState();
}

class _MyNavigationBarState extends ConsumerState<MyNavigationBar> {
  String currentRoute = Routes.home;
  @override
  Widget build(BuildContext context) {
    Widget navItem(String asset, {required String route}) {
      Widget curr = MySvg(asset, height: 32);
      curr = GestureDetector(
        onTap: () => setState(() {
          currentRoute = route;
          context.go(route);
        }),
        child: curr,
      );
      curr = AnimatedContainer(
        padding: EdgeInsets.only(bottom: 4),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: route == currentRoute
              ? Border(bottom: BorderSide(color: Colors.white, width: 3))
              : null,
        ),
        child: curr,
      );
      return curr;
    }

    Widget current = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        navItem(MyAssets.homeIcon, route: Routes.home),
        const GapH(24),
        navItem(MyAssets.communityIcon, route: Routes.community),
        const GapH(24),
        navItem(MyAssets.recipesIcon, route: Routes.recipes),
        const GapH(24),
        navItem(MyAssets.profileIcon, route: Routes.profile),
      ],
    );
    current = SymPadding(h: 32, v: 16, child: current);
    current = DecoratedBox(
      decoration: BoxDecoration(
        color: mc.pinkMain,
        borderRadius: BorderRadius.circular(50),
      ),
      child: current,
    );

    return current;
  }
}
