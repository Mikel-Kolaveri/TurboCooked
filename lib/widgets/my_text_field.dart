import 'package:flutter/material.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, this.hint, this.label, this.isPsw = false});
  final String? hint;
  final String? label;
  final bool isPsw;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _showPass = false;
  @override
  Widget build(BuildContext context) {
    final labelTxt = widget.label;

    Widget? eyeIcon;
    if (widget.isPsw != false) {
      eyeIcon = _showPass ? Icon(Icons.visibility_off) : Icon(Icons.visibility);
      eyeIcon = GestureDetector(
        onTap: () => setState(() => _showPass = !_showPass),
        child: eyeIcon,
      );
    }

    Widget current = TextField(
      obscuringCharacter: '●',
      obscureText: widget.isPsw && !_showPass,
      enableSuggestions: !widget.isPsw,
      autocorrect: !widget.isPsw,
      style: ms.pop16w400Grey.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixIcon: eyeIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 32),
        hintText: widget.hint,
        hintStyle: ms.pop16w400Grey,
        filled: true,
        fillColor: mc.textfieldFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );

    if (labelTxt != null) {
      current = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_Label(labelTxt), const GapV(8), current],
      );
    }
    return current;
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return MyText(text, ms.pop15w600TextPrime);
  }
}
