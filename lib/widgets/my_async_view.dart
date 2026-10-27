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
    this.color,
  });
  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  final bool Function(T data)? isEmpty;
  final String emptyMessage;
  final VoidCallback? onRetry;

  /// Spinner and "Try again" color, for backgrounds where pinkMain would be invisible.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return value.when(
      // A rebuild triggered by a watched dependency (e.g. an invalidated
      // repository) counts as a reload; keep the old data instead of a spinner.
      skipLoadingOnReload: true,
      // "Try again" is a refresh, which skips the spinner by default and leaves
      // the error up. Skip it only when there's data to keep showing.
      skipLoadingOnRefresh: !value.hasError,
      loading: () =>
          Center(child: CircularProgressIndicator(color: color ?? mc.pinkMain)),
      error: (_, __) => _ErrorMessage(onRetry: onRetry, color: color),
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
  const _ErrorMessage({required this.onRetry, required this.color});
  final VoidCallback? onRetry;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText.center('Something went wrong.', ms.pop13w400TextPrime),
        if (onRetry != null) ...[
          const GapV(8),
          MyText(
            'Try again',
            ms.pop13w600PinkMain.copyWith(color: color),
            onTap: onRetry,
          ),
        ],
      ],
    );
    current = Center(child: current);
    return current;
  }
}
