import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final currentUserProvider =
    NotifierProvider<UserNotifier, AppUser?>(() => UserNotifier());

class UserNotifier extends Notifier<AppUser?> {
  @override
  AppUser? build() {
    final client = Supabase.instance.client;
    final sub = client.auth.onAuthStateChange.listen((event) {
      final user = event.session?.user;
      state = user != null ? AppUser.fromSupabaseUser(user) : null;
    });
    ref.onDispose(sub.cancel);
    final user = client.auth.currentUser;
    return user != null ? AppUser.fromSupabaseUser(user) : null;
  }
}
