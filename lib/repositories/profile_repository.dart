import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/models/profile.dart';
import 'package:recipe_app/repositories/fake_database.dart';
import 'package:recipe_app/repositories/fake_profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => FakeProfileRepository(
    ref.watch(fakeDatabaseProvider),
    currentProfile: () => ref.read(currentProfileProvider),
  ),
);

abstract interface class ProfileRepository {
  Future<Profile?> fetchProfile(String id);
}
