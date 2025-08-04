import 'package:flutter/material.dart';
import 'package:recipe_app/extensions/color_ext.dart';
import 'package:recipe_app/constants/my_assets.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

const headings = ['Get inspired', 'Learn and improve your skills'];
const texts = [
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

  int length = texts.length;
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
        MyText(headings[_index], ms.popTextPrime20w600),
        const GapV(8),
        MyText(texts[_index], ms.popTextPrime13w400),
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
          child: Button.pinkLight(text: 'Continue', onTap: incIndex),
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

    return current;
  }
}
