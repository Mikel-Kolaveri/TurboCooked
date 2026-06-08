import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseConfig {
  static const String url = 'https://aefqgmpetddgxigpsjrz.supabase.co';
  static const String publishableKey =
      'sb_publishable_l1GLES8699cMZoY0UjVS4Q_NgONEVTO';

  static const String redirectUrl = 'com.turbocooked.app://login';
}

Future<void> startSupabase() async {
  await Supabase.initialize(
    url: SupabaseConfig.url,
    publishableKey: SupabaseConfig.publishableKey,
  );
}
