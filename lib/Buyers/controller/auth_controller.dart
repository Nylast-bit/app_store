import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



//Metodo para registrar un nuevo usuario
class AuthController{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  Future<String> createNewUser(String email, String password, String name) async{
    String res = "Something went wrong";

    try{
      UserCredential _userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      res = "Success";
      //Almacenar el usuario en la base de datos Firestore
      _firebaseFirestore.collection('buyers')
          .doc(_userCredential.user!.uid)
            .set({
              'fullname': name,
              'email': email,
              'profileImage': "",
              'uid': _userCredential.user!.uid,
              'city': "",
              'state': "",
            });

    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';

      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';

      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(String email, String password) async{
    String res = "Something went wrong";

    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      res = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided for that user.';
      }
    } catch (e){
      res = e.toString();
    }
    return res;
  }

}