import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

  class AppState with ChangeNotifier {
  late User? user;
  List<Map<String, dynamic>> basket = [];
  Map<String, dynamic> userData = {};

  bool get isAuthenticated => user != null;

  setUser(User? user) {
    this.user = user;
    notifyListeners();
  }

  setUserData(Map<String, dynamic> userData){
    this.userData = userData;
    notifyListeners();
  }

  addProduct(Map<String, dynamic> product) {
    basket.add(product);
    print(basket);
  }

  void removeProduct(int index) {
    if (index >= 0 && index < basket.length) {
      basket.removeAt(index);
      notifyListeners();
    }
  }

  void addFavorite(String productId) async {
    if (!userData.containsKey('favorites')) {
      userData['favorites'] = [];
    }

    if (!userData['favorites'].contains(productId)) {
      userData['favorites'].add(productId);
      notifyListeners();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'favorites': FieldValue.arrayUnion([productId])
      });
    }
  }

  void removeFavorite(String productId) async {
    if (userData['favorites'].contains(productId)) {
      userData['favorites'].remove(productId);
      notifyListeners();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'favorites': FieldValue.arrayRemove([productId])
      });
    }
  }

  void addCard(Map<String, dynamic> card) {
    userData['cards'].add(card);
    notifyListeners();
  }

  void removeCard(Map<String, dynamic> card) {
    userData['cards'].remove(card);
    notifyListeners();
  }
  void addAddress(Map<String, dynamic> address) {
    userData['addresses'].add(address);
    notifyListeners();
  }

  void removeAddress(Map<String, dynamic> address) {
    userData['addresses'].remove(address);
    notifyListeners();
  }
}
