import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateNotifier = AuthStateNotifier();

final authStateNotifierProvider =
    ChangeNotifierProvider<AuthStateNotifier>((_) => authStateNotifier);

class AuthStateNotifier extends ChangeNotifier {
  StreamSubscription<AuthState>? _subscription;
  bool _isGuest = false;

  AuthStateNotifier() {
    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((state) {
      if (state.event == AuthChangeEvent.signedIn) _isGuest = false;
      notifyListeners();
    });
  }

  bool get isAuthenticated => Supabase.instance.client.auth.currentUser != null;
  bool get isGuest => _isGuest;
  bool get hasAppAccess => isAuthenticated || _isGuest;

  void continueAsGuest() {
    _isGuest = true;
    notifyListeners();
  }

  void exitGuest() {
    _isGuest = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
