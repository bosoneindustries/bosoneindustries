import 'package:bosone_app/services/fire_auth.dart';
import 'package:bosone_app/services/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _signupFormKey = GlobalKey<FormState>();

  TextEditingController _nameField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusName.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Form(
                key: _signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/bosone.png',
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    Text(
                      'Bosone.io',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    TextFormField(
                      controller: _nameField,
                      focusNode: _focusName,
                      validator: (value) =>
                          Validator.validateName(name: _nameField.text),
                      decoration: InputDecoration(
                          hintText: 'John Doe',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                    TextFormField(
                      controller: _emailField,
                      focusNode: _focusEmail,
                      validator: (value) =>
                          Validator.validateEmail(email: value),
                      decoration: InputDecoration(
                          hintText: 'example@email.com',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                    TextFormField(
                      controller: _passwordField,
                      focusNode: _focusPassword,
                      validator: (value) =>
                          Validator.validatePassword(password: value),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                    _isProcessing
                        ? CircularProgressIndicator()
                        : Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.grey[850],
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  _isProcessing = true;
                                });
                                if (_signupFormKey.currentState!.validate()) {
                                  User? user = await FireAuth
                                      .registerUsingEmailPasswords(
                                          name: _nameField.text,
                                          email: _emailField.text,
                                          password: _passwordField.text);
                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (user != null) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfilePage(user: user),
                                      ),
                                      ModalRoute.withName('/'),
                                    );
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
