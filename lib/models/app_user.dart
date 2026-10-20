import 'package:supabase_flutter/supabase_flutter.dart';

class AppUser {
  final String id;
  final String email;
  final String? fullName;
  final String? avatarUrl;

  const AppUser({
    required this.id,
    required this.email,
    this.fullName,
    this.avatarUrl,
  });

  factory AppUser.fromSupabaseUser(User user) {
    final metadata = user.userMetadata;
    return AppUser(
      id: user.id,
      email: user.email ?? '',
      // Email signup stores `full_name`; Google sign-in stores `name`.
      fullName: (metadata?['full_name'] ?? metadata?['name']) as String?,
      avatarUrl: metadata?['avatar_url'] as String?,
    );
  }

  String get displayName => fullName ?? email.split('@').first;
  String get userEmail => email;
}
