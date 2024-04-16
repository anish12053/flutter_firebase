
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FireBaseAuthServices {
   FirebaseAuth _auth = FirebaseAuth.instance;

   Future<User?> signUpWithEmailAndPassword(String email , String password) async {
      try {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        return credential.user;
      }on FirebaseAuthException catch(e){
      if(e.code == 'email-already-in-use'){
        Fluttertoast.showToast(msg: "Email already in use");
        toastLength: Toast.LENGTH_SHORT;
        gravity: ToastGravity.BOTTOM;
        timeInSecForIosWeb: 1;
        backgroundColor: Colors.red;
        textColor: Colors.white;
        fontSize: 16.0;
      }else{
        Fluttertoast.showToast(msg: "An error Occured: ${e.code}");
        toastLength: Toast.LENGTH_SHORT;
        gravity: ToastGravity.BOTTOM;
        timeInSecForIosWeb: 1;
        backgroundColor: Colors.red;
        textColor: Colors.white;
        fontSize: 16.0;
      }
      }
      return null;
   }

   Future<User?> signInWithEmailAndPassword(String email , String password) async {
    try {
      UserCredential credential  = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential'){
        Fluttertoast.showToast(msg: "Invalid username and password");
        toastLength: Toast.LENGTH_SHORT;
        gravity: ToastGravity.BOTTOM;
        timeInSecForIosWeb: 1;
        backgroundColor: Colors.red;
        textColor: Colors.white;
        fontSize: 16.0;
      }else{
        Fluttertoast.showToast(msg: "An error Occured: ${e.code}");
        toastLength: Toast.LENGTH_SHORT;
        gravity: ToastGravity.BOTTOM;
        timeInSecForIosWeb: 1;
        backgroundColor: Colors.red;
        textColor: Colors.white;
        fontSize: 16.0;
      }
    }
    return null;
   }
}