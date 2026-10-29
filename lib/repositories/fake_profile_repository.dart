import 'package:recipe_app/models/profile.dart';
import 'package:recipe_app/repositories/fake_database.dart';
import 'package:recipe_app/repositories/profile_repository.dart';

class FakeProfileRepository implements ProfileRepository {
  FakeProfileRepository(this._db, {required this.currentProfile});
  final FakeDatabase _db;
  final Profile? Function() currentProfile;

  @override
  Future<Profile?> fetchProfile(String id) async {
    await _db.simulateNetworkDelay();
    // Signed-up users aren't in the seed. The real profiles table gets their
    // row from the signup trigger.
    final me = currentProfile();
    if (me?.id == id) return me;
    return _db.profiles.where((p) => p.id == id).firstOrNull;
  }
}
