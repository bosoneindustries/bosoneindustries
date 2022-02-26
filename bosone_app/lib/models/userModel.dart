import 'dart:async';
import 'dart:convert';

import 'package:bosone_app/globals.dart' as globals;

class UserModel {
  late Map<String, dynamic> userDataMap;
  late String? uid;
  late String? fullName;
  late String? emailId;

  UserModel();

  UserModel.fromJson(Map<String, dynamic>? parsedJson) {
    uid = parsedJson!['uid'];
    fullName = parsedJson['displayName'];
    emailId = parsedJson['emailId'];
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'name': fullName,
      'email': emailId,
    };
  }
}
