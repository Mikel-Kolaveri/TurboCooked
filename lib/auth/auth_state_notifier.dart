import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateNotifier = AuthStateNotifier();

final authStateNotifierProvider =
    ChangeNotifierProvider<AuthStateNotifier>((_) => authStateNotifier);

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
