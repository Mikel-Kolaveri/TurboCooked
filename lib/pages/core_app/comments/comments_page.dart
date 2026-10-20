import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/providers/comments_provider.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/comment_tile.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/my_text_field.dart';

class CommentsPage extends ConsumerWidget {
  const CommentsPage({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentsProvider(recipe));
    final isGuest = ref.watch(authStateNotifierProvider).isGuest;

    Widget header = Row(
      children: [
        const BackBtn(),
        const GapH(16),
        MyText('Comments', ms.pop18w600TextPrime),
      ],
    );
    header = Column(children: [const GapTop(size: 24), header, const GapV(16)]);
    header = HPadding(16, header);

    Widget list = comments.isEmpty
        ? Center(
            child: MyText(
              'No comments yet. Be the first!',
              ms.pop13w400TextPrime,
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemCount: comments.length,
            separatorBuilder: (_, __) => const GapV(20),
            itemBuilder: (context, index) =>
                CommentTile(comment: comments[index]),
          );

    return Column(
      children: [
        header,
        Expanded(child: list),
        isGuest ? const _GuestBar() : _InputBar(recipe: recipe),
      ],
    );
  }
}

class _InputBar extends ConsumerStatefulWidget {
  const _InputBar({required this.recipe});
  final Recipe recipe;

  @override
  ConsumerState<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<_InputBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    final author = ref.read(currentProfileProvider);
    if (text.isEmpty || author == null) return;
    ref
        .read(commentsProvider(widget.recipe).notifier)
        .add(text: text, author: author);
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    Widget send = MyCircleBox(
      color: mc.pinkMain,
      padding: 12,
      child: Icon(Icons.send_rounded, color: mc.white, size: 20),
    );
    send = GestureDetector(onTap: _send, child: send);

    Widget current = Row(
      children: [
        Expanded(
          child: MyTextField(hint: 'Add a comment...', controller: _controller),
        ),
        const GapH(8),
        send,
      ],
    );
    return _BottomBar(child: current);
  }
}

class _GuestBar extends StatelessWidget {
  const _GuestBar();

  @override
  Widget build(BuildContext context) {
    Widget current = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText('Want to join the conversation? ', ms.pop13w400TextPrime),
        MyText(
          'Sign in',
          ms.pop13w600PinkMain,
          onTap: () => context.go(Routes.login),
        ),
      ],
    );
    current = VPadding(8, current);
    return _BottomBar(child: current);
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget current = SymPadding(h: 16, v: 12, child: child);
    current = DecoratedBox(
      decoration: BoxDecoration(
        color: mc.bg,
        border: Border(top: BorderSide(color: mc.pinkMain.opacityTo(0.25))),
      ),
      child: current,
    );
    return current;
  }
}
