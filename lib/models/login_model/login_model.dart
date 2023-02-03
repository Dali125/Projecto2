import 'package:firebase_auth/firebase_auth.dart';

class LoginModel {

  String email;
  String password;

  LoginModel({required this.email, required this.password});

  Future SignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('object');
    }
  }

}

class LogoutModel{
Future signOut() async{


  await FirebaseAuth.instance.signOut();

}




}