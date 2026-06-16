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
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    final black = Colors.black;

    Widget image = MyNetworkImage(
      widget.imageUrl,
      height: widget.height,
    );

    Widget ratingBadge = Container(
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
          GapH(4),
          MyText(widget.rating.toStringAsFixed(1), ms.pop13w700TextPrime),
        ],
      ),
    );

    Widget likeButton = GestureDetector(
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

    Widget stats = Row(
      children: [
        _StatChip(
          icon: Icons.access_time_rounded,
          label: '${widget.cookTime} min',
        ),
        GapH(8),
        _StatChip(
          icon: Icons.chat_bubble_outline_rounded,
          label: '${widget.comments}',
        ),
        GapH(8),
        _StatChip(
          icon: Icons.remove_red_eye_outlined,
          label: '${widget.views}',
        ),
      ],
    );

    Widget bottomContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MyNetworkAvatar(widget.avatarUrl, radius: 14, borderColor: mc.pinkMain),
            GapH(8),
            MyText(widget.username, ms.pop13w600PinkMain),
            GapH(10),
            Icon(
              Icons.access_time_rounded,
              color: Colors.white.opacityTo(0.5),
              size: 12,
            ),
            GapH(4),
            MyText(widget.timeAgo.timeAgo(), ms.pop12w400TextPrime),
          ],
        ),
        GapV(6),
        MyText(widget.title, ms.pop18w600TextPrime),
        GapV(6),
        MyText(widget.description, ms.pop12w400TextPrime, lines: 2),
        GapV(10),
        stats,
      ],
    );

    Widget current = Stack(
      children: [
        Positioned.fill(child: image),
        Positioned(top: 16, left: 16, child: ratingBadge),
        Positioned(top: 16, right: 16, child: likeButton),
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
            child: bottomContent,
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
          GapH(5),
          MyText(label, ms.pop13w400TextPrime),
        ],
      ),
    );
  }
}
