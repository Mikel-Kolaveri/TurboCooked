import 'package:flutter/widgets.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';

//The 'TH' after the color stands for text height
enum _Type { pinkLightTH20, pinkMainTH20 }

class Button extends StatelessWidget {
  const Button.pinkLightTH20({
    super.key,
    required this.text,
    required this.onTap,
  }) : _type = _Type.pinkLightTH20;
  const Button.pinkMainTH20({
    super.key,
    required this.text,
    required this.onTap,
  }) : _type = _Type.pinkMainTH20;
  final String text;
  final Function() onTap;
  final _Type _type;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    Color color;
    switch (_type) {
      case _Type.pinkLightTH20:
        style = ms.pop20w600PinkMain;
        color = mc.pinkCream;
        break;
      case _Type.pinkMainTH20:
        style = ms.pop20w600TextPrime;
        color = mc.pinkMain;
        break;
    }

    Widget current = MyText(text, style);
    current = SymPadding(h: 8, v: 12, child: current);
    current = Center(child: current);
    current = Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      width: 200,
      child: current,
    );
    current = UnconstrainedBox(child: current);
    current = GestureDetector(onTap: onTap, child: current);

    return current;
  }
}
