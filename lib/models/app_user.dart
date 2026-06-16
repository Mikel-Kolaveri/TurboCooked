import 'package:supabase_flutter/supabase_flutter.dart';

class AppUser {
  final String id;
  final String email;
  final String? fullName;

  const AppUser({required this.id, required this.email, this.fullName});

  factory AppUser.fromSupabaseUser(User user) {
    return AppUser(
      id: user.id,
      email: user.email ?? '',
      fullName: user.userMetadata?['full_name'] as String?,
    );
  }

  String get displayName => fullName ?? email.split('@').first;
  String get userEmail => email;
}
