import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final currentUserProvider = StateNotifierProvider<UserNotifier, AppUser?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<AppUser?> {
  UserNotifier() : super(null) {
    _sync();
    authStateNotifier.addListener(_sync);
  }

  void _sync() {
    final user = Supabase.instance.client.auth.currentUser;
    state = user != null ? AppUser.fromSupabaseUser(user) : null;
  }

  @override
  void dispose() {
    authStateNotifier.removeListener(_sync);
    super.dispose();
  }
}

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
