import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/profile.dart';
import 'package:recipe_app/repositories/profile_repository.dart';

final profileProvider = FutureProvider.family<Profile?, String>(
  (ref, id) => ref.watch(profileRepositoryProvider).fetchProfile(id),
);
