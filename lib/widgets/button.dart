import 'package:flutter/widgets.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

//The 'TH' after the color stands for text height
enum _Type { pinkLightTH20 }

class Button extends StatelessWidget {
  const Button.pinkLight({super.key, required this.text, required this.onTap})
    : _type = _Type.pinkLightTH20;
  final String text;
  final Function() onTap;
  final _Type _type;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    switch (_type) {
      case _Type.pinkLightTH20:
        style = ms.popPinkLight20w600;
        break;
    }

    Widget current = MyText(text, style);
    current = SymPadding(h: 8, v: 12, child: current);
    current = Center(child: current);
    current = Container(
      decoration: BoxDecoration(
        color: mc.pinkCream,
        borderRadius: BorderRadius.circular(50),
      ),
      width: 200,
      child: current,
    );
    current = GestureDetector(onTap: onTap, child: current);

    return current;
  }
}
