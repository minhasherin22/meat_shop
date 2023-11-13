import 'package:firebase_auth/firebase_auth.dart';
class firebaseHelper{
   final FirebaseAuth auth = FirebaseAuth.instance;
    get user => auth.currentUser;
  Future<String?> Login({required String username, required String pass})async {
    try {
     await auth.signInWithEmailAndPassword(
      email: username,
      password: pass);
     return null;
} on FirebaseAuthException catch (e) {
  return e.message;
}
  }

 Future<String?> register({required String regname, required String regpass})async {
   try {
      await auth.createUserWithEmailAndPassword(
          email: regname,
          password: regpass);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
 }

 

}