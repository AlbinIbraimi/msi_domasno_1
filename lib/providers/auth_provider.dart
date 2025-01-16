import 'package:domasna_1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuthServiceProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _user;
  get user => _user;

  bool _showSignIn = true;
  bool get showSignIn => _showSignIn;

  void toggleSignIn() {
    _showSignIn = !_showSignIn;
    notifyListeners();
  }

  MyUser _userFromFirebase(User? user) {
    return MyUser(
        user?.uid ?? "",
        user?.email ?? "",
        DateFormat('yyyy-MM-dd')
            .format(user?.metadata.creationTime ?? DateTime.now()));
  }

  Future<MyUser?> signInAnno() async {
    try {
      var result = await _auth.signInAnonymously();
      if (result.user != null) {
        _user = _userFromFirebase(result.user);
        notifyListeners();
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    var currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _auth.currentUser?.delete();
      _user = null;
      notifyListeners();
    }
  }

  Future<MyUser?> signInWithEmailPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        _user = _userFromFirebase(result.user);
        notifyListeners();
        return _user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<MyUser?> registerWithEmailAndPassword(
      String email, String pass, String confPass) async {
    if (pass != confPass) {
      return null;
    }

    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (result.user != null) {
        _user = _userFromFirebase(result.user);
        notifyListeners();
        return _user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
