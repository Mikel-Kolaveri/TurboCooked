import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Feeds auth state changes into GoRouter's refreshListenable so the router
// re-evaluates its redirect callback whenever the user signs in or out.
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
