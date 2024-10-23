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

  checkUser() async {
    var userName = auth.currentUser?.displayName;
    if (userName != null) {
      return userName;
    } else {
      throw Exception("Usuario não logado");
    }
  }

  register(name, email, password) async {
    var user = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await user.user!.updateDisplayName(name);
    return user;
  }
}
