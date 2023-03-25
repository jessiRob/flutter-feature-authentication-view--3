import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String? _userID = FirebaseAuth.instance.currentUser?.uid;

  String? get userID => _userID; //information from user


  Future<User?> userInfo() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (final providerProfile in user.providerData) {
        // ID of the provider (google.com, apple.com, etc.)
        final provider = providerProfile.providerId;

        // UID specific to the provider
        final uid = await providerProfile.uid;

        // Name, email address, and profile photo URL
        final name = providerProfile.displayName;
        final emailAddress = providerProfile.email;
        final profilePhoto = providerProfile.photoURL;

        print(uid);
        return user;
      }
    }
  }

  //is user signed in?
  User? signIn(){
    bool? ans;
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out! desde signedIn');
      }
      else {
        print('User is signed in! desde signedIn');
      }
    });
    return FirebaseAuth.instance.currentUser;
  }

  // auth change user stream
  StreamSubscription<User?> get user {
    return FirebaseAuth.instance
        .idTokenChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }


  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


// register with email and password
  Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // sign out
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}