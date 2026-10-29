import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/providers/comments_provider.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/comment_tile.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_async_view.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/my_text_field.dart';

class CommentsPage extends ConsumerWidget {
  const CommentsPage({super.key, required this.recipeId});
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGuest = ref.watch(authStateNotifierProvider).isGuest;
    final origin = Routes.tabRoot(GoRouterState.of(context).uri);

    Widget header = Row(
      children: [
        const BackBtn(),
        const GapH(16),
        MyText('Comments', ms.pop18w600TextPrime),
      ],
    );
    header = Column(children: [const GapTop(size: 24), header, const GapV(16)]);
    header = HPadding(16, header);

    Widget list = MyAsyncView(
      value: ref.watch(commentsProvider(recipeId)),
      isEmpty: (comments) => comments.isEmpty,
      emptyMessage: 'No comments yet. Be the first!',
      onRetry: () => ref.invalidate(commentsProvider(recipeId)),
      builder: (comments) => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: comments.length,
        separatorBuilder: (_, __) => const GapV(20),
        itemBuilder: (context, index) {
          final comment = comments[index];
          return CommentTile(
            comment: comment,
            onAuthorTap: () =>
                context.push(Routes.user(comment.author.id, origin: origin)),
          );
        },
      ),
    );

    return Column(
      children: [
        header,
        Expanded(child: list),
        isGuest ? const _GuestBar() : _InputBar(recipeId: recipeId),
      ],
    );
  }
}

class _InputBar extends ConsumerStatefulWidget {
  const _InputBar({required this.recipeId});
  final String recipeId;

  @override
  ConsumerState<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<_InputBar> {
  final _controller = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isSending) return;
    setState(() => _isSending = true);
    try {
      await ref.read(commentsProvider(widget.recipeId).notifier).add(text);
      _controller.clear();
      if (mounted) FocusScope.of(context).unfocus();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Couldn't post your comment. Try again."),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget send = MyCircleBox(
      color: mc.pinkMain,
      padding: 12,
      child: _isSending
          ? SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(color: mc.white, strokeWidth: 2),
            )
          : Icon(Icons.send_rounded, color: mc.white, size: 20),
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
