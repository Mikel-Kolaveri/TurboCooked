import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/models/app_user.dart';
import 'package:recipe_app/models/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final currentUserProvider = Provider<AppUser?>((ref) {
  ref.watch(authStateNotifierProvider);
  final user = Supabase.instance.client.auth.currentUser;
  return user != null ? AppUser.fromSupabaseUser(user) : null;
});

final currentProfileProvider = Provider<Profile?>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  return Profile(
    id: user.id,
    // Derived from displayName, so users with the same name collide.
    // Replace with profiles.username once that table exists.
    username: user.displayName.toLowerCase().replaceAll(' ', '_'),
    displayName: user.displayName,
    avatarUrl: user.avatarUrl ?? '',
  );
});
