import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_svg.dart';

//TODO: fix navbar state UI logic to correspond with the page

class MyNavigationBar extends ConsumerStatefulWidget {
  const MyNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyNavigationBarState();
}

class _MyNavigationBarState extends ConsumerState<MyNavigationBar> {
  String currentRoute = Routes.home;

  Widget _navItem(String asset, {required String route}) {
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
        border: Border(
          bottom: BorderSide(
            color: route == currentRoute ? mc.textPrime : mc.pinkMain,
            width: 3,
          ),
        ),
      ),
      child: curr,
    );
    return curr;
  }

  @override
  Widget build(BuildContext context) {
    Widget current = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _navItem(MyAssets.homeIcon, route: Routes.home),
        const GapH(24),
        _navItem(MyAssets.communityIcon, route: Routes.community),
        const GapH(24),
        _navItem(MyAssets.recipesIcon, route: Routes.recipes),
        const GapH(24),
        _navItem(MyAssets.profileIcon, route: Routes.profile),
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
