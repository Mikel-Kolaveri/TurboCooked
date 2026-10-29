import 'package:go_router/go_router.dart';

extension PathParamExtension on GoRouterState {
  /// Reads the `:name` path segment.
  /// Throws if the pathParameter doesn't exist instead of saying null check on null value used.
  String pathParam(String name) =>
      pathParameters[name] ??
      (throw StateError('Missing path parameter "$name" in ${uri.path}'));
}
