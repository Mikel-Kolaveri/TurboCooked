import 'package:flutter/material.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/extensions/datetime_extension.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/my_network_avatar.dart';
import 'package:recipe_app/widgets/my_network_image.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

class CommunityRecipeCard extends StatefulWidget {
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
    required this.comments,
    required this.views,
    required this.isLiked,
    this.onTap,
    this.height = 380,
  });

  final String username;
  final DateTime timeAgo;
  final String avatarUrl;
  final String imageUrl;
  final String title;
  final double rating;
  final String description;
  final int cookTime;
  final int comments;
  final int views;
  final bool isLiked;
  final VoidCallback? onTap;
  final double height;

  @override
  State<CommunityRecipeCard> createState() => _CommunityRecipeCardState();
}

class _CommunityRecipeCardState extends State<CommunityRecipeCard> {
  @override
  Widget build(BuildContext context) {
    final black = Colors.black;

    Widget current = Stack(
      children: [
        Positioned.fill(
          child: MyNetworkImage(widget.imageUrl, height: widget.height),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: _RatingBadge(rating: widget.rating),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: _LikeButton(isLiked: widget.isLiked),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [black.opacityTo(0.5), black.opacityTo(0.8)],
              ),
            ),
            child: _BottomContent(
              avatarUrl: widget.avatarUrl,
              username: widget.username,
              timeAgo: widget.timeAgo,
              title: widget.title,
              description: widget.description,
              cookTime: widget.cookTime,
              comments: widget.comments,
              views: widget.views,
            ),
          ),
        ),
      ],
    );
    current = SizedBox(height: widget.height, child: current);
    current = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: current,
    );
    current = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mc.pinkMain.opacityTo(0.25), width: 1),
      ),
      child: current,
    );
    if (widget.onTap != null) {
      current = GestureDetector(onTap: widget.onTap, child: current);
    }
    return current;
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.opacityTo(0.60),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mc.pinkMain.opacityTo(0.45), width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: mc.pinkMain, size: 14),
          const GapH(4),
          MyText(rating.toStringAsFixed(1), ms.pop13w700TextPrime),
        ],
      ),
    );
  }
}

class _LikeButton extends StatefulWidget {
  const _LikeButton({required this.isLiked});

  final bool isLiked;

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isLiked = !_isLiked),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.black.opacityTo(0.55),
          shape: BoxShape.circle,
          border: Border.all(
            color: _isLiked ? mc.pinkMain : Colors.white.opacityTo(0.5),
            width: 1.5,
          ),
        ),
        child: Icon(
          _isLiked ? Icons.favorite : Icons.favorite_border,
          color: _isLiked ? mc.pinkMain : Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _BottomContent extends StatelessWidget {
  const _BottomContent({
    required this.avatarUrl,
    required this.username,
    required this.timeAgo,
    required this.title,
    required this.description,
    required this.cookTime,
    required this.comments,
    required this.views,
  });

  final String avatarUrl;
  final String username;
  final DateTime timeAgo;
  final String title;
  final String description;
  final int cookTime;
  final int comments;
  final int views;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MyNetworkAvatar(avatarUrl, radius: 14, borderColor: mc.pinkMain),
            const GapH(8),
            MyText(username, ms.pop13w600PinkMain),
            const GapH(8),
            Icon(
              Icons.access_time_rounded,
              color: Colors.white.opacityTo(0.5),
              size: 12,
            ),
            const GapH(4),
            MyText(timeAgo.timeAgo(), ms.pop12w400TextPrime),
          ],
        ),
        const GapV(4),
        MyText(title, ms.pop18w600TextPrime),
        const GapV(4),
        MyText(description, ms.pop12w400TextPrime, lines: 2),
        const GapV(8),
        Wrap(
          children: [
            _StatChip(icon: Icons.access_time_rounded, label: '$cookTime min'),
            const GapH(8),
            _StatChip(
              icon: Icons.chat_bubble_outline_rounded,
              label: '$comments',
            ),
            const GapH(8),
            _StatChip(icon: Icons.remove_red_eye_outlined, label: '$views'),
          ],
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.opacityTo(0.45),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.opacityTo(0.15), width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: mc.pinkLight, size: 13),
          const GapH(4),
          MyText(label, ms.pop13w400TextPrime),
        ],
      ),
    );
  }
}
