import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/screens/authpage.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/entity/app_state.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> authUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'favorites': [],
        'addresses': [],
        'cards': [],
      });

      await userCredential.user!.updateDisplayName(name);

      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        context.read<AppState>().setUserData(userData);

        return null;
      } else {
        return 'Erro ao recuperar os dados do usuário';
      }

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "Email já cadastrado";
      } else {
        return e.code;
      }
    }
  }

  Future<String?> loginUser(
      {required String email, required String password,required BuildContext context}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        context.read<AppState>().setUserData(userData);
        return null;
      } else {
        return 'Usuário não encontrado no Firestore';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      context.read<AppState>().setUser(null);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao realizar logout: $e')),
      );
    }
  }
}
