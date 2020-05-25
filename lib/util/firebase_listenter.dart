import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthListener {
  onLoginUserVerified(FirebaseUser currentUser);
  onError(String message);
}
