import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final currentUserProvider = StateNotifierProvider<UserNotifier, AppUser?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<AppUser?> {
  StreamSubscription<AuthState>? _subscription;

  UserNotifier() : super(null) {
    final current = Supabase.instance.client.auth.currentUser;
    state = current != null ? AppUser.fromSupabaseUser(current) : null;

    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      final user = event.session?.user;
      state = user != null ? AppUser.fromSupabaseUser(user) : null;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
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
