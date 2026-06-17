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

  @override
  Widget build(BuildContext context) {
    Widget current = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NavItem(
          asset: MyAssets.homeIcon,
          route: Routes.home,
          currentRoute: currentRoute,
          onTap: (r) => setState(() { currentRoute = r; context.go(r); }),
        ),
        const GapH(24),
        _NavItem(
          asset: MyAssets.communityIcon,
          route: Routes.community,
          currentRoute: currentRoute,
          onTap: (r) => setState(() { currentRoute = r; context.go(r); }),
        ),
        const GapH(24),
        _NavItem(
          asset: MyAssets.recipesIcon,
          route: Routes.recipes,
          currentRoute: currentRoute,
          onTap: (r) => setState(() { currentRoute = r; context.go(r); }),
        ),
        const GapH(24),
        _NavItem(
          asset: MyAssets.profileIcon,
          route: Routes.profile,
          currentRoute: currentRoute,
          onTap: (r) => setState(() { currentRoute = r; context.go(r); }),
        ),
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

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.asset,
    required this.route,
    required this.currentRoute,
    required this.onTap,
  });

  final String asset;
  final String route;
  final String currentRoute;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    Widget current = MySvg(asset, height: 32);
    current = GestureDetector(onTap: () => onTap(route), child: current);
    current = AnimatedContainer(
      padding: const EdgeInsets.only(bottom: 4),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: route == currentRoute ? mc.textPrime : mc.pinkMain,
            width: 3,
          ),
        ),
      ),
      child: current,
    );
    return current;
  }
}
