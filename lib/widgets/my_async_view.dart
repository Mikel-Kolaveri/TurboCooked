import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_text.dart';

class MyAsyncView<T> extends StatelessWidget {
  const MyAsyncView({
    super.key,
    required this.value,
    required this.builder,
    this.isEmpty,
    this.emptyMessage = 'Nothing here yet',
    this.onRetry,
  });
  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  final bool Function(T data)? isEmpty;
  final String emptyMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () =>
          Center(child: CircularProgressIndicator(color: mc.pinkMain)),
      error: (_, __) => _ErrorMessage(onRetry: onRetry),
      data: (data) {
        if (isEmpty?.call(data) ?? false) {
          return Center(
            child: MyText.center(emptyMessage, ms.pop13w400TextPrime),
          );
        }
        return builder(data);
      },
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.onRetry});
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText.center('Something went wrong.', ms.pop13w400TextPrime),
        if (onRetry != null) ...[
          const GapV(8),
          MyText('Try again', ms.pop13w600PinkMain, onTap: onRetry),
        ],
      ],
    );
    current = Center(child: current);
    return current;
  }
}
