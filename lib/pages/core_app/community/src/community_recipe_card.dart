import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/extensions/datetime_extension.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';

class CommunityRecipeCard extends StatefulWidget {
  final String username;
  final DateTime timeAgo;
  final String avatarUrl;
  final String imageUrl;
  final String title;
  final int rating;
  final String description;
  final int cookTime;
  final int views;
  final int comments;
  final bool isLiked;

  const CommunityRecipeCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarUrl,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.description,
    required this.cookTime,
    required this.views,
    required this.comments,
    required this.isLiked,
  });

  @override
  State<CommunityRecipeCard> createState() => _CommunityRecipeCardState();
}

class _CommunityRecipeCardState extends State<CommunityRecipeCard> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.white.opacityTo(0.2);

    Widget top = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(widget.avatarUrl),
          ),
          GapH(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.username, style: ms.pop16w400TextPrime),
              Text(widget.timeAgo.timeAgo(), style: ms.pop13w600PinkMain),
            ],
          ),
        ],
      ),
    );

    var image = Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: borderColor, width: 1),
          vertical: BorderSide(color: borderColor, width: 0.5),
        ),
      ),
      child: Image.network(
        widget.imageUrl,
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 220,
            color: const Color(0xFF4A2525),
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFFEF5C62)),
            ),
          );
        },
      ),
    );

    var likeIcon = GestureDetector(
      onTap: () => setState(() => _isLiked = !_isLiked),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: mc.pinkMain, shape: BoxShape.circle),
        child: Icon(
          _isLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
          size: 20,
        ),
      ),
    );

    Widget current = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        top,
        Stack(
          children: [
            image,
            Positioned(top: 12, right: 12, child: likeIcon),
          ],
        ),
        _CardDescription(widget: widget),
      ],
    );

    current = Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.white.opacityTo(0.2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: current,
    );
    current = GestureDetector(
      child: current,
      onTap: () => context.go(Routes.recipeDetails(origin: Routes.community)),
    );
    return current;
  }
}

class _CardDescription extends StatelessWidget {
  const _CardDescription({required this.widget});

  final CommunityRecipeCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffb7002c),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + rating
          Row(
            children: [
              Expanded(child: Text(widget.title, style: ms.pop18w600TextPrime)),
              GapH(16),
              Text('${widget.rating}', style: ms.pop15w600TextPrime),
              GapH(4),
              Icon(Icons.star_rounded, color: mc.textPrime, size: 18),
            ],
          ),

          // Description + time/views
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  widget.description,
                  style: ms.spart18w700TextPrime,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const GapH(16),
            ],
          ),
          const GapV(8),
          Wrap(
            direction: Axis.horizontal,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: mc.textPrime,
                    size: 20,
                  ),
                  GapH(4),
                  Text('${widget.cookTime}', style: ms.pop15w500TextPrime),
                ],
              ),
              GapH(8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: mc.textPrime,
                    size: 20,
                  ),
                  GapH(4),
                  Text('${widget.comments}', style: ms.pop15w500TextPrime),
                ],
              ),
              GapH(8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.remove_red_eye, color: mc.textPrime, size: 20),
                  GapH(4),
                  Text('${widget.views}', style: ms.pop15w500TextPrime),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
