import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

class AuthProvider {
  const AuthProvider(this.ref);

  final AuthRef ref;

  FutureOr<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
  return AuthProvider(ref);
}
