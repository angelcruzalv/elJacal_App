import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  final _auth = FirebaseAuth.instance;
  Future<FirebaseUser> createUser({String email = "", String password = ""})async{
    try {
    
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
    } catch (e) {
      print(e);
    }
    return null;
    
  }
  }
 