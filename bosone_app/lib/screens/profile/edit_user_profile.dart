import 'package:bosone_app/models/userModel.dart';
import 'package:bosone_app/services/firebase/manage_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bosone_app/globals.dart' as globals;

class EditUserProfile extends StatefulWidget {
  const EditUserProfile();

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  late TextEditingController _fullNameField =
      TextEditingController(text: 'text');
  late TextEditingController _cityField = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fullNameField.dispose();
    _cityField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Profile Settings'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: globals.userDocumentStream,
            builder: (context, snapshot) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Full Name'),
                        TextFormField(
                          controller: _fullNameField,
                          decoration: const InputDecoration(
                              hintText: 'Jon',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                        const Text('City'),
                        TextFormField(
                          controller: _cityField,
                          decoration: const InputDecoration(
                              hintText: 'Doe',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.currentUser!
                                .updateDisplayName(_fullNameField.toString());
                            ManageUser().updateUserData(
                                displayName: _fullNameField.text);
                            print(
                                'Setting display Name to ${_fullNameField.text}');
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          child: const Text('Save'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
