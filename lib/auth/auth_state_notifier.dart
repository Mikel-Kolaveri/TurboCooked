import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Single shared instance — used by GoRouter (refreshListenable) and
// UserNotifier, so there is exactly one Supabase auth stream subscription.
final authStateNotifier = AuthStateNotifier();

class AuthStateNotifier extends ChangeNotifier {
  StreamSubscription<AuthState>? _subscription;

  AuthStateNotifier() {
    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((_) {
      notifyListeners();
    });
  }

  bool get isAuthenticated => Supabase.instance.client.auth.currentUser != null;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
