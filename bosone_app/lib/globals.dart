library bosoneapp.globals;

import 'dart:async';
import 'dart:convert';

import 'package:bosone_app/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bosone_app/services/firebase/manage_user.dart';
import 'package:flutter/cupertino.dart';

User? user;
late FirebaseFirestore firestore;
bool isLoggedIn = false;
ManageUser firestoreUser = ManageUser();

//User Data
Stream<DocumentSnapshot<Map<String, dynamic>>> userDocumentStream =
    firestore.collection('users').doc(user!.uid).snapshots();
