

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {

    Future<bool> loginORcreateuser(String email, String password) async{
      try {
      await _signIn(email, password);
      return true;
      } catch (e) {
        try {
          await _signUp(email, password);
      return true;
        } catch (e) {
          return false;
        }
      }
    }

    _signIn(String email, String password)async{
    await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }

     _signUp(String email, String password)async{
    await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    }
}