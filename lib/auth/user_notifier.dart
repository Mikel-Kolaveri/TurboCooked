import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/auth_state_notifier.dart';
import 'package:recipe_app/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final currentUserProvider = Provider<AppUser?>((ref) {
  ref.watch(authStateNotifierProvider);
  final user = Supabase.instance.client.auth.currentUser;
  return user != null ? AppUser.fromSupabaseUser(user) : null;
});
