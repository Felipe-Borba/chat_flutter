import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try {
      return await auth.signInWithEmailAndPassword(
        email: "felipe.borba0109@gmail.com",
        password: "123456789",
      );
    } catch (e) {
      throw e;
    }
  }

  recoverPassword() async {
    try {
      await auth.sendPasswordResetEmail(
        email: "felipe.borba0109@gmail.com",
      );
      return true;
    } catch (e) {
      throw e;
    }
  }
}
