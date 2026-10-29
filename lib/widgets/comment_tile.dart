import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_comment.dart';
import 'package:recipe_app/extensions/datetime_extension.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_text.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.comment, this.onAuthorTap});
  final RecipeComment comment;
  final VoidCallback? onAuthorTap;

  @override
  Widget build(BuildContext context) {
    Widget header = Row(
      children: [
        Flexible(
          child: MyText(
            comment.author.displayName,
            ms.pop13w600PinkMain,
            lines: 1,
            onTap: onAuthorTap,
          ),
        ),
        const GapH(8),
        MyText(comment.createdAt.timeAgo(), ms.pop12w400PinkLight),
      ],
    );

    Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header,
        const GapV(2),
        MyText(comment.text, ms.pop13w400TextPrime),
      ],
    );

    Widget avatar = MyNetworkAvatar(
      comment.author.avatarUrl,
      radius: 18,
      borderColor: mc.pinkMain,
    );
    avatar = GestureDetector(onTap: onAuthorTap, child: avatar);

    Widget current = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const GapH(12),
        Expanded(child: body),
      ],
    );
    return current;
  }
}
