// ignore_for_file: missing_return

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop/Model/user.dart';

class FirebaseData {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
    return await fs.collection("users").get();

    // FirebaseFirestore -> collection ('name') -> get()  -> value (QuerySnapshot) -> docs  List<QueryDocumentSnapshot> -> foreach  ;
    // FirebaseFirestore -> collection('name') -> doc ('id') -> get() -> QueryDocumentSnapshot value;
  }

  Future<UserModel> getUser({required String uid}) async {
    final user = await fs.collection("users").doc('$uid').get();
    UserModel userdata = UserModel.fromJson(user.data());
    return userdata;
  }

  Future<dynamic> signin(
      {required String email, required String password}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return user;
      // ignore: empty_catches
    } on FirebaseAuthException catch (error) {
      String? errorMessage;
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      return errorMessage;
    }
  }

  Future signUp_WithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential user = await _auth.signInWithCredential(credential);
        final getuser = await FirebaseFirestore.instance
            .collection('users')
            .where('uId', isEqualTo: '${user.user!.uid}')
            .limit(1)
            .get();
        if (getuser.docs.isNotEmpty) {
          return 'User Registered before';
        }
        return user;
      }
      // ignore: empty_catches
    } catch (error) {
      return error.toString();
    }
  }

  Future signIn_WithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential user = await _auth.signInWithCredential(credential);
        final getuser = await FirebaseFirestore.instance
            .collection('users')
            .where('uId', isEqualTo: '${user.user!.uid}')
            .limit(1)
            .get();
        if (getuser.docs.isEmpty) {
          return 'User not Registered ';
        }
        return user;
      }
      // ignore: empty_catches
    } catch (error) {
      return error.toString();
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      return userCredential;
      //   return userCredential.user.uid ?? "null";
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  Future<void> adduser(UserModel userInfo) async {
    await fs.collection('users').doc(userInfo.uId).set(userInfo.toMap());
  }

  Future signUp({required String email, required String password}) async {
    try {
      final getuser = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: '$email')
          .limit(1)
          .get();
      if (getuser.docs.isNotEmpty) {
        return 'User Registered before';
      }
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (error) {
      String? errorMessage;

      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      return errorMessage;
    }
  }
}
