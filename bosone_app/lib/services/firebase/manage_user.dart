import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bosone_app/globals.dart' as globals;

class ManageUser {
  late final String userId;
  late final String displayName;
  late final String? companyName;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUserData({userId, displayName}) async {
    try {
      globals.firestore.collection('users').doc(userId);
      print('created a document $displayName in the user databse');
    } catch (e) {
      print('Could not add user');
      print(e);
    }
    try {
      globals.firestore.collection('users').doc(userId).set({
        'userId': userId,
        'displayName': displayName,
      });
      print('added $displayName in the user databse, with uid $userId');
    } catch (e) {
      print('could not set user');
      print(e);
    }
  }

  Future<void> updateUserData({userId, displayName, companyName}) async {
    try {
      globals.firestore
          .collection('users')
          .doc(globals.user!.uid)
          .update({'displayName': displayName});
      print('Updating user data for uid:${globals.user!.uid} in the database');
    } catch (e) {
      print('erroe');
    }
  }
}
