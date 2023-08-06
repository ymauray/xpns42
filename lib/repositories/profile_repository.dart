import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/profile.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  FutureOr<void> addProfile(String uid, Profile profile) async {
    final profileRef = FirebaseDatabase.instance.ref('/profiles/$uid');
    final newProfile = profileRef.push();
    await newProfile.set(profile.copyWith(id: newProfile.key).toJson());
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepository();
}
