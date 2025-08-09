import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

const _headings = ['Get inspired', 'Learn and improve your skills'];
const _texts = [
  'Get inspired with our daily recipe recommendations.',
  'Learn essential cooking techniques at your own pace.',
];
const assets = [MyAssets.landing1, MyAssets.landing2];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _index = 0;

  int length = _texts.length;
  void incIndex() => setState(() => _index < length - 1 ? _index++ : () {});
  void decIndex() => setState(() => _index > 0 ? _index-- : () {});

  @override
  Widget build(BuildContext context) {
    Widget back = Image.asset(MyAssets.back, height: 20);
    back = GestureDetector(onTap: decIndex, child: back);

    Widget header = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GapV(32),
        Row(),
        _index != 0 ? back : const GapV(20),
        const GapV(24),
        MyText(_headings[_index], ms.pop20w600TextPrime),
        const GapV(8),
        MyText(_texts[_index], ms.pop13w400TextPrime),
        const GapV(64),
      ],
    );

    header = Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black.opacityTo(0.6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: header,
    );

    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header,
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: Button.pinkLightTH20(
            text: 'Continue',
            onTap: _index == _headings.length - 1
                ? () => context.go(Routes.signUp)
                : incIndex,
          ),
        ),

        GapBottom(),
      ],
    );

    current = Column(
      children: [
        Expanded(child: current),
        GapBottom(),
      ],
    );

    current = Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assets[_index]),
          fit: BoxFit.cover,
        ),
      ),
      child: current,
    );

    current = SafeArea(child: current);
    current = Scaffold(body: current);

    return current;
  }
}
