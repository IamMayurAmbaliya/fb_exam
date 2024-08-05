import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthServices {
  AuthServices._();

  static final AuthServices authServices = AuthServices._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> anonymousLogin() async {
    UserCredential credential = await firebaseAuth.signInAnonymously();
    return credential.user;
  }

  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = credential.user;
    } catch (e) {
      Logger().e("EXCEPTION: ${e.toString()}");
    }
    return user;
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = credential.user;
    } catch (e) {
      Logger().e("EXCEPTION: ${e.toString()}");
    }
    return user;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await firebaseAuth.signInWithCredential(credential);
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
