import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/profile.dart';
import 'package:xpns42/provider/crypto_provider.dart';
import 'package:xpns42/provider/secure_storage_provider.dart';
import 'package:xpns42/repository/profile_repository.dart';

part 'auth_provider.g.dart';

class AuthProvider {
  const AuthProvider({
    required this.crypto,
    required this.profileRepository,
    required this.secureStorage,
  });

  final ICryptoProvider crypto;
  final ProfileRepository profileRepository;
  final SecureStorage secureStorage;

  String get currentUserDisplayName =>
      FirebaseAuth.instance.currentUser?.displayName ??
      FirebaseAuth.instance.currentUser?.email ??
      '';

  FutureOr<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //final keys = crypto.generateKeys();
      final keys = crypto.generateKeys();
      final publicKeyString = crypto.encodePublicKeyToPemPKCS1(keys.publicKey);
      await profileRepository.addProfile(
        credentials.user!.uid,
        Profile(publicKey: publicKeyString),
      );
      await secureStorage.storeKeys(account: email, keys: keys);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  FutureOr<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  FutureOr<void> updateProfile({
    required String displayName,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
    } on FirebaseAuthException {
      rethrow;
    }
  }
}

@riverpod
AuthProvider auth(AuthRef ref) {
  final crypto = ref.read(cryptoProvider);
  final profileRepository = ref.read(profileRepositoryProvider);
  final secureStorage = ref.read(secureStorageProvider.notifier);

  return AuthProvider(
    crypto: crypto,
    profileRepository: profileRepository,
    secureStorage: secureStorage,
  );
}
